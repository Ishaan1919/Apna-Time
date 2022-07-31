from datetime import datetime
import time
from flask import Flask, render_template

def apnaTime():
   scofday = int(datetime.now().strftime("%H"))*3600 + int(datetime.now().strftime("%M")) * 60 + int(datetime.now().strftime("%S"))
   apnaH = scofday//1080
   apnaM = (scofday - apnaH * 1080 )//24
   apnaS = (scofday - (apnaH * 1080 + apnaM * 24))
   ntime = str(apnaH)+" : "+str(apnaM)+" : "+str(apnaS)
   return(ntime)
   time.sleep(1.0)




app = Flask(__name__)





@app.route('/')
def home():
    
   return render_template('main.html',stime = apnaTime())
if __name__ == '__main__':
   app.run()
   while(True):
      print(apnaTime())

   


