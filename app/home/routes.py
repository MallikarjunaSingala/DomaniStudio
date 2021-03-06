# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from app.home import blueprint
from flask import render_template, redirect, url_for, request
from flask_login import login_required, current_user
from app import login_manager
from jinja2 import TemplateNotFound

import mysql.connector
from mysql.connector.constants import ClientFlag


config = {
    'user': 'root',
    'password': 'root',
    'host': '127.0.0.1',
    'port': '3306',
    'database': 'domani'
}
@blueprint.route('/index')
@login_required
def index():
    return render_template('index.html', segment='index')

@blueprint.route('/enterexpense')
@login_required
def enterexpense():
    cnxn = mysql.connector.connect(**config)
    db = cnxn.cursor(buffered=True)
    db.execute('''SELECT id,name FROM projects''')
    projects = db.fetchall()
    db.execute('''SELECT id,name FROM category''')
    categories = db.fetchall()
    db.execute('''SELECT id,name FROM module''')
    modules = db.fetchall()
    db.execute('''SELECT id,name FROM sub_category''')
    sub_cats = db.fetchall()
    db.execute('''SELECT id,name FROM vendors''')
    vendors = db.fetchall()
    print(vendors)
    return render_template('expense_entry.html', segment='expense',
            projects=projects,
            categories=categories,
            modules=modules,
            sub_cats=sub_cats,
            vendors=vendors)

@blueprint.route('/vendors', methods=['GET', 'POST'])
@login_required
def vendors():
    cnxn = mysql.connector.connect(**config)
    db = cnxn.cursor(buffered=True)
    db.execute('''
    SELECT
        COLUMN_NAME
    FROM
    INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME="vendors"
    AND COLUMN_NAME NOT IN(
        "logo",
        "create_time",
        "update_time"
        )
    ''')
    columns = db.fetchall()
    db.execute('''
    SELECT
    id,
    name,
    address,
    account_details,
    phone_pe_number,
    gpay_number,
    contact_number,
    email_id
    from vendors
    ''')
    vendors = db.fetchall()
    return render_template('vendor_details.html', columns=columns,vendors=vendors)

@blueprint.route('/add_vendor',methods=['GET', 'POST'])
@login_required
def add_vendor():
    cnxn = mysql.connector.connect(**config)
    db = cnxn.cursor(buffered=True)
    if request.method == 'POST':
        name = request.form['name']
        add = request.form['add']
        acc = request.form['acc']
        ppay = request.form['ppay']
        gpay = request.form['gpay']
        email = request.form['email']
        con = request.form['con']
        remark = request.form['remark']
        db.execute('''
        INSERT INTO vendors(
            name,address,Account_details,
            phone_pe_number,gpay_number,contact_number,
            email_id,remarks)
            VALUES(%s,%s,%s,
            %s,%s,%s,
            %s,%s)
        ''',[name,add,acc,ppay,gpay,con,email,remark])
        cnxn.commit()
        return redirect(url_for('home_blueprint.vendors'))
    return  redirect(url_for('home_blueprint.vendors'))

@blueprint.route('/edit_vendor/<id>',methods=['GET', 'POST'])
@login_required
def edit_vendor(id):
    cnxn = mysql.connector.connect(**config)
    db = cnxn.cursor(buffered=True)
    if request.method == 'POST':
        name = request.form['name']
        add = request.form['add']
        acc = request.form['acc']
        ppay = request.form['ppay']
        gpay = request.form['gpay']
        email = request.form['email']
        con = request.form['con']
        remark = request.form['remark']
        db.execute('''
        UPDATE vendors
        SET name = %s,
        address=%s,Account_details=%s,
            phone_pe_number=%s,gpay_number=%s,contact_number=%s,
            email_id=%s,remarks=%s
        ''',[name,add,acc,ppay,gpay,con,email,remark])
        cnxn.commit()
        return redirect(url_for('home_blueprint.vendors'))
    return  redirect(url_for('home_blueprint.vendors'))

@blueprint.route('/<template>')
@login_required
def route_template(template):

    try:

        if not template.endswith( '.html' ):
            template += '.html'

        # Detect the current page
        segment = get_segment( request )

        # Serve the file (if exists) from app/templates/FILE.html
        return render_template( template, segment=segment )

    except TemplateNotFound:
        return render_template('page-404.html'), 404
    
    except:
        return render_template('page-500.html'), 500

# Helper - Extract current page name from request 
def get_segment( request ): 

    try:

        segment = request.path.split('/')[-1]

        if segment == '':
            segment = 'index'

        return segment    

    except:
        return None  
