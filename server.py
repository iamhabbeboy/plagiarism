from flask import Flask ,url_for,render_template,request,abort,jsonify
from  werkzeug.debug import get_current_traceback
import pymysql.cursors
import math
app = Flask(__name__)
connection = pymysql.connect(host='localhost', user='root', password='', db='flask', charset='utf8mb4', cursorclass=pymysql.cursors.DictCursor)

@app.route('/', methods=['POST', 'GET'])
def index():
  count = 0    
  found = []
  new_doc = []
  student = []
  new_record = []
  old_me = []
  totalP = 0
  percentA = 0

  if request.method == 'POST':    
    with connection.cursor() as cursor:
      # Read a single record
      doc_type = request.form['doc_type'].encode('ascii', 'ignore').lower()
      doc_ = request.form['document'].encode('ascii', 'ignore').lower()
      new_doc = doc_.split('.')
      """ Query Table for Record """
      sql = "SELECT * FROM `documents`"
      cursor.execute(sql)
      result = cursor.fetchall()
      prt = ""

      """ This is the Old Documents From DB """
      for old in xrange(len(result)):
        old_ones = result[old]['docs'].encode('ascii', 'ignore').lower()
        old_split = old_ones.split('.')
        student_name = result[old]['name'].encode('ascii', 'ignore')
        student_matric = result[old]['matric'].encode('ascii', 'ignore')

        for x in xrange(len(old_split)):
          old_var = old_split[x].strip()        
          """ This is for the new Doc... """
          for doc in xrange(len(new_doc)):  
            new_ones = new_doc[doc].strip().lower()
            #found += new_ones + " ==== "
            if old_var == new_ones:
              if new_ones != '':    
                old_me.append(old_var)    
                found.append(new_ones)  
                student.append(student_name)
                count = count +1

            totalP = int(len(old_me)) + int(len(found))
            pera = len(found) * 100 
            #per = float(totalP) / pera
            #percentA = math.floor(per)
  
    
            """ End New Doc """   
  else:
      result = ""        
  return render_template("home.html", data=found, counter=len(found), std=student)

@app.route('/add-new', methods=['GET', 'POST'])
def add_new():
  lpush = ''
  if request.method == 'POST':
    doc_type = request.form['doc_type'].encode('ascii', 'ignore')
    doc_main = request.form['document'].encode('ascii', 'ignore')
    #a = doc_type + "_" + doc_main    
    #lpush.append(a)
    cursor = connection.cursor()
    sql = "INSERT INTO `documents`(`docs`, `doc_type`) VALUES(%s, %s)"
    cursor.execute(sql, (doc_main, doc_type))
    connection.commit()
    lpush = 'Record Added Successfully !'
  else:
    lpush = ''      
  return render_template('add-new.html', data=lpush)

@app.route('/login')
def login():
      return render_template('login.html')

@app.route('/dashboard')
def dashboard():
      return render_template('dashboard.html')

@app.route('/view')
def view():
  connect = connection.cursor()   
  sql = "SELECT * FROM `documents` ORDER BY id DESC"
  connect.execute(sql)
  result = connect.fetchall()
  _doc_type = {}
  _doc_ = {}
  for x in xrange(len(result)):
    _doc_type[x] = result[x]['doc_type'].encode('ascii', 'ignore')
    _doc_[x] = result[x]['docs'].encode('ascii', 'ignore')
  
  return render_template('view.html', data=_doc_type, doc=_doc_)

@app.errorhandler(500)
def internal_error(error):
  return "500 error"

@app.errorhandler(404)
def not_found(error):
  return "404 error",404

if __name__== "__main__":
    app.run(debug=True)