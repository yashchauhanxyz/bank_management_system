import datetime
import mysql.connector
from random import randint
import mysql.connector
mydb= mysql.connector.connect(host="localhost",user="root",password= 'yash1234',database="bank_management")
mycursor=mydb.cursor()
print("***********************************************")
print("           BANK MANAGEMENT SYSTEM")
print("***********************************************")
print("      ================================")
print("      ----Welcome to National Bank---- ")
print("***********************************************")
print("=<< 1. Open a new account                   >>=")
print("=<< 2. Withdraw Money                       >>=")
print("=<< 3. Deposit Money                        >>=")
print("=<< 4. Balance Enquiry                      >>=")
print("=<< 5. Close Account                        >>=")
print("=<< 6. Exit/Quit                            >>=")
print("***********************************************")



def Create_Account():
    name=input("Enter the Account holder name: ")
    yob=int(input("Enter year of birth: "))
    mob=int(input("Enter month of birth: "))
    d_ob=int(input("Enter date of birth: "))
    DOB=datetime.datetime(yob,mob,d_ob)
    city=input("Enter your City: ")
    ph_no=int(input("Enter Phone Number: "))
    balance=0
    branch_id=int(input("insert branch id"))
    acc_type=input("enter account type")
    acc_no=randint(10**5,(10**6)-1)
    mycursor.execute("INSERT INTO accounts VALUES(%s,%s,%s,%s,%s)",(acc_no,acc_type,balance,branch_id,datetime.date.today()))
    mycursor.execute("INSERT INTO customer VALUES(%s,%s,%s,%s,%s)",(acc_no,name,city,ph_no,DOB))
    mydb.commit()
    print("----New account created successfully !----")
    print("Your Account Number: ",acc_no)
    print("Your Account Balance: ",balance)



def Withdraw_Money():
    acc_no=int(input("Enter your Account Number: "))
    mon=int(input("Enter the Amount you want to withdraw: "))
    mycursor.execute("select * from accounts where account_no=%s",(acc_no,))
    myrecords=mycursor.fetchall()
    for row in myrecords:
        balance=row[2]
        if mon>balance:
                print ("Not enough Balance")
        else:
            balance-=mon
            print("Amount Withdrawn: ",mon)
            print("Your Account Balance: ",balance)
            mycursor.execute("Update accounts set balance=%s where\
            account_no=%s",(balance,acc_no))
    mydb.commit()

def Deposit_Money():
    acc_no=int(input("Enter Your Account Number: "))
    mon=int(input("Enter Amount of money you want to Deposit: "))
    mycursor.execute("select * from accounts where account_no=%s",(acc_no,))
    myrecords=mycursor.fetchall()
    for row in myrecords:
        balance=row[2]
        mycursor.execute("Update accounts set balance=balance+%s where\
        account_no=%s",(mon,acc_no))
    mydb.commit()
    balance=balance+mon
    print("Amount deposited: ",mon)
    print("Your Account Balance: ",balance)

def Balance_Enquiry():
    acc_number=int(input('enter your account number'))
    mycursor.execute('select account_no,balance from accounts where\
    account_no=%s',(acc_number,))
    record=mycursor.fetchall()
    for row in record:
        print('account number : ',row[0])
        print('current balance: ',row[1])


def Close_Account():
    acc_number=int(input('enter your account number'))
    mycursor.execute('DELETE from accounts where account_no=%s',(acc_number,))
    mydb.commit()
    print('account closed')


ch="y"
while ch=="y":
    choicenumber = input("Select your choice number from the above menu : ")
    if choicenumber == "1":
        Create_Account()
    elif choicenumber =="2":
        Withdraw_Money()
    elif choicenumber== "3":
        Deposit_Money()
    elif choicenumber== "4":
        Balance_Enquiry()
    elif choicenumber== "5":
        Close_Account()
    elif choicenumber == "6":
        ch="n"
        print("Thank you for using our banking system!")

    
