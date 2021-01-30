## Antonio Maldonado
## CS 482 Project Phase 2
## This is an interface for interacting with the data from phase 1 of our project

from tkinter.ttk import *
from tkinter import *
import mysql.connector
from tkinter import messagebox
import csv
import contextlib
import time

mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "t21-.M7047Nm",
    database = "NFLProject")

mycursor = mydb.cursor()
root = Tk()
root.title("CS 482 Project Phase 2")
root.geometry("1200x700")

v = StringVar()           
q = StringVar()  
sql = StringVar()
s = StringVar()

##Option for Single option
def SingleOptions():
    buttonPlayers = Button(root, text = "Single Insert into players table", width = 23, height = 2,  command = SinglePlayers).grid(row = 9, column = 0)
    buttonGames = Button(root, text = "Single Insert into games table", width = 23, height = 2, command = SingleGames).grid(row = 10, column = 0)
    buttonM = Button(root, text = "Insert your own records", width = 23, height = 2, command = SelfInsert).grid(row = 11, column = 0) 

def SelfInsert():
    query = Entry(root, textvariable = q, width = 30)
    query.grid(row = 0, column = 0, padx = 20)
    
    # Text box
    values = Entry(root, textvariable = v, width = 30)
    values.grid(row =0, column = 10, padx = 20)
    
    # Text box label
    query_label = Label(root, text = "INSERT INTO table_name (column) VALUES (%s)")
    query_label.grid(row = 1, column = 0)

    values_label = Label(root, text = "enter in format (values)")
    values_label.grid(row = 1, column = 10)

    # Submit button
    submit_btn = Button(root, text = "Add data", command = submit)
    submit_btn.grid(row = 6,column = 0, columnspan = 2, pady = 10, padx = 10, ipadx = 100)
    return q, v

##execute the selfInsert to test the contraints 
def submit():
    mycursor.execute(q.get(), (v.get(),))
    print("add")

## Single insert - Games
def SingleGames():
    print("Single Insertion")
    start_time = time.time()
    csv_data = csv.reader(open('players200k.csv'))
    
    for row in csv_data:
            mycursor.execute('INSERT INTO players(name,playerID,teamname,playpos,touchdowns,totalyards,salary) VALUES (%s,%s,%s,%s,%s,%s,%s)', 
                             row)

    print('The single insertion of players200k took', time.time() - start_time, 'to run')  
    timer = round(time.time() - start_time)
    messagebox.showinfo("Time","took {} sec to insert".format( timer))
        
## Single insert - Players
def SinglePlayers():
    print("Single Insertion")
    start_time = time.time()
    csv_data = csv.reader(open('players200k.csv'))
    
    for row in csv_data:
            mycursor.execute('INSERT INTO players(name,playerID,teamname,playpos,touchdowns,totalyards,salary) VALUES (%s,%s,%s,%s,%s,%s,%s)', 
                             row)

    print('The single insertion of players200k took', time.time() - start_time, 'to run')  
    timer = round(time.time() - start_time)
    messagebox.showinfo("Time","took {} sec to insert".format( timer))
    
## Bulk option
def BulkOptions():
    buttonPlayers = Button(root, text = "Bulk Insert into players table", width = 23, height = 2, command = BulkPlayers).grid(row = 9, column = 0)
    buttonGames = Button(root, text = "Bulk Insertion into games table", width = 23, height = 2).grid(row = 10, column = 0)

## Bulk insert - Players
def BulkPlayers():
     start_time = time.time()
     mycursor.execute("LOAD DATA INFILE 'players200k.csv' INTO TABLE players columns terminated by ',' \n")
     timer = round(time.time() - start_time)
     messagebox.showinfo("Time","took {} sec to insert".format( timer))

def execute():
    start_timer = time.time()
    mycursor.execute(s.get())

    row = mycursor.fetchall()
    for row in mycursor:
        print(row)

    timer = round(time.time() - start_timer)
    messagebox.showinfo("SQLQueryResult","%s\n and it took %s to run the query"%(row,timer))
  

def sqlQuery():
    exsql = Button(root, text = "Execute SQL Query", width = 13, height = 2, command = execute).grid(row = 0, column = 22)        
    squery = Entry(root, textvariable = s, width = 30)
    squery.grid(row = 0, column = 20, padx = 20)
    squerylabel = Label(root, text = "Enter a query")
    squerylabel.grid(row = 0, column = 21)
    return squery
    
def Deleteplayers():
    Delete = "delete from players"
    mycursor.execute(Delete)
    mydb.commit()
    messagebox.showinfo("Information","Record Deleted")
    
def Deletegames():
    deleteg = "SET FOREIGN_KEY_CHECKS = OFF; delete from games"
    mycursor.execute(deleteg)
    messagebox.showinfo("Information","Record Deleted")
    
##Show all entries in player table
def Showall():
    class A(Frame):
        def __init__(self, parent):
            Frame.__init__(self, parent)
            self.CreateUI()
            self.LoadTable()
            self.grid(sticky = (N, S, W, E))
            parent.grid_rowconfigure(0, weight = 1)
            parent.grid_columnconfigure(0, weight = 1)
        def CreateUI(self):
            tv= Treeview(self)
            tv['columns'] = ('Name', 'playerID', 'teamname', 'positions', 'touchdowns', 'totalyards', 'salary')
            tv.heading('#0', text = 'Name', anchor = 'center')
            tv.column('#0', anchor = 'center')
            tv.heading('#1', text = 'playerID', anchor = 'center')
            tv.column('#1', anchor = 'center')
            tv.heading('#2', text = 'teamname', anchor = 'center')
            tv.column('#2', anchor = 'center')
            tv.heading('#3', text = 'positions', anchor = 'center')
            tv.column('#3', anchor = 'center')
            tv.heading('#4', text = 'TouchDowns', anchor = 'center')
            tv.column('#4', anchor = 'center')
            tv.heading('#5', text = 'TotalYards', anchor = 'center')
            tv.column('#5', anchor = 'center')
            tv.heading('#6', text = 'Salary', anchor = 'center')
            tv.column('#6', anchor = 'center')
            tv.grid(sticky = (N,S,W,E))
            self.treeview = tv
            self.grid_rowconfigure(0, weight = 1)
            self.grid_columnconfigure(0, weight = 1)
        def LoadTable(self):
            Select = "Select * from players"
            mycursor.execute(Select)
            result = mycursor.fetchall()
            name = ""
            playerID = ""
            teamname = ""
            position = ""
            touchdowns = ""
            Totalyards = ""
            Salary = ""
            for i in result:
                name = i[0]
                playerID = i[1]
                teamname = i[2]
                position = i[3]
                touchdowns = i[4]
                Totalyards = i[5]
                Salary = i[6]
                self.treeview.insert("",'end', text = name, values = (playerID,teamname,position,touchdowns,Totalyards,Salary))
    root = Tk()
    root.title("Players Table")
    A(root)

## Show all entries in Game table
def ShowallGames():
    class B(Frame):
        def __init__(self, parent):
            Frame.__init__(self, parent)
            self.CreateUI()
            self.LoadTable()
            self.grid(sticky = (N, S, W, E))
            parent.grid_rowconfigure(0, weight = 1)
            parent.grid_columnconfigure(0, weight = 1)
        def CreateUI(self):
            tv= Treeview(self)
            tv['columns'] = ('GameID', 'Date', 'Stadium', 'Result', 'Attendance', 'Ticket Revenue')
            tv.heading('#0', text = 'GameID', anchor = 'center')
            tv.column('#0', anchor = 'center')
            tv.heading('#1', text = 'Date', anchor = 'center')
            tv.column('#1', anchor = 'center')
            tv.heading('#2', text = 'Stadium', anchor = 'center')
            tv.column('#2', anchor = 'center')
            tv.heading('#3', text = 'Result', anchor = 'center')
            tv.column('#3', anchor = 'center')
            tv.heading('#4', text = 'Attendance', anchor = 'center')
            tv.column('#4', anchor = 'center')
            tv.heading('#5', text = 'Ticket Revenue', anchor = 'center')
            tv.column('#5', anchor = 'center')
            tv.grid(sticky = (N,S,W,E))
            self.treeview = tv
            self.grid_rowconfigure(0, weight = 1)
            self.grid_columnconfigure(0, weight = 1)
        def LoadTable(self):
            Select = "Select * from games"
            mycursor.execute(Select)
            result = mycursor.fetchall()
            RollNo = ""
            First_Name = ""
            Last_Name = ""
            Phone_Number = ""
            City = ""
            State = ""
            Age = ""
            for i in result:
                RollNo = i[0]
                First_Name = i[1]
                Last_Name = i[2]
                Phone_Number = i[3]
                City = i[4]
                State = i[5]
                self.treeview.insert("",'end', text = RollNo, values = (First_Name,Last_Name,Phone_Number,City,State,Age))
    root = Tk()
    root.title("Games Page")
    B(root)    

##HOME BUTTONS    
## SQL Query 
button15 = Button(root, text = "SQL Query", width = 13, height = 2, command = sqlQuery).grid(row = 0, column = 23)     
## Single Insertion   
button1 = Button(root, text = "Single Insertion", width = 13, height = 2, command = SingleOptions).grid(row = 7, column = 0)
## Bulk insertion
button7 = Button(root, text = "Bulk Insertion", width = 13, height = 2, command = BulkOptions).grid(row = 8, column = 0)
## Delete
button2 = Button(root, text = "Delete data from players table", width = 23, height = 2, command = Deleteplayers).grid(row = 7, column = 1)
button10 = Button(root, text = "Delete data from game table", width = 23, height = 2, command = Deletegames).grid(row = 8, column = 1)
## Show all tables
button5 = Button(root, text = "Show All players table", width = 20, height = 2, command = Showall).grid(row = 7, column = 7)
button9 = Button(root, text = "Show All games table", width = 20, height = 2, command = ShowallGames).grid(row = 8, column = 7)
##mydb.close()
root.mainloop()
