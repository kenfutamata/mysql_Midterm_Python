import mysql.connector
import datetime
db = mysql.connector.connect(
    host = "127.0.0.1", 
    user = "root", 
    password = "",
    database = "system_bank"
)

lname = ""
fname = ""

cursor = db.cursor()


def main():
    try:
        while True:
            print("1. Registration")
            print("2. Login")
            print("3. Exit")
            choose = int(input("Select to manage your account: "))
            choose_manage_account(choose)
    except:
        print("Invalid. Please try again")
        main()



def choose_manage_account(choose):
    match(choose):
        case 1:
            register()
        case 2:
            login()
        case 3:
            exit()
        case _:
            print("Please select only numbers 1 to 3")


def select_account_to_manage(accountNumber):
    try:
        print("\n")
        print("Welcome to the Bank of the World")
        print("1. Check/Change PIN")
        print("2. Balance Inquiry")
        print("3. Withdrawal")
        print("4. Deposit")
        print("5. Exit")
        chooseMain = int(input("Choose a function to manage your bank Account: "))
        choose_account_to_manage(chooseMain, accountNumber)
    except:
        print("Invalid. Please select a function")
        select_account_to_manage(accountNumber)

def choose_account_to_manage(chooseMain,accountNumber):
    match(chooseMain):
        case 1:
            menu_pin_function(accountNumber)
        case 2:
            balance_inquiry(accountNumber)
        case 3:
            withdrawal(accountNumber)
        case 4:
            deposit(accountNumber)
        case 5:
            SystemExit()
        case _:
            print("Please Try again")

# Part 1: Change/update pin part

def menu_pin_function(accountNumber):
    try:

        print("\n")
        print("1. Check PIN")
        print("2. Change PIN")
        print("3. Exit")
        pinChoose = int(input("Choose a PIN function: "))
        choose_pin_function(pinChoose, accountNumber)
    except:
        print("Invalid. Please select a PIN function")
        menu_pin_function(accountNumber)

def choose_pin_function(pinChoose, accountNumber):
    match(pinChoose):
        case 1: 
            check_pin(accountNumber)
        case 2:
            update_pin_number(accountNumber)
        case 3:
            select_account_to_manage(accountNumber)



def check_pin(accountNumber):
    sql = "SELECT PIN FROM users_bank WHERE accountNumber = %s"
    val = (accountNumber,)
    cursor.execute(sql,val)
    displayPin = cursor.fetchone()
    print("The PIN Number is: ")

    for x in displayPin:
        print(x)
        
    menu_pin_function(accountNumber)
    
def update_pin_number(accountNumber):
    updatePin = int(input("Enter the updated PIN Number: "))

    if PINnumber(updatePin):
        sql = "UPDATE users_bank SET PIN = %s WHERE accountNumber = %s"
        val = (updatePin, accountNumber,)
        cursor.execute(sql,val)
        db.commit()
        print("PIN updated successfully")
        menu_pin_function(accountNumber)
    else:
        print("Invalid PIN. Please try again")
        
    
def PINnumber(PIN):
    pin_number = str(PIN)
    if pin_number.isdigit() and len(pin_number) == 6:
        return int(pin_number)
    else:
        print("Please enter a 6 digit PIN Number: ")
    
#Part 2: Balance Inquiry

def balance_inquiry(accountNumber):
    sql = "SELECT amountValue FROM users_bank WHERE accountNumber = %s"
    val = (accountNumber,)
    cursor.execute(sql,val)
    displayPin = cursor.fetchone()
    print("Your Current Balance is: ")

    for x in displayPin:
        print(x)
    
    select_account_to_manage(accountNumber)
    
#Part 3: Withdrawal
def withdrawal(accountNumber):

    amountwithdrawn = float(input("Enter the amount to Withdraw: "))
    if amountwithdrawn >= 10000:
        print("Your withdrawal has exceeded 10000. Please enter a account that is lower than 10000. ")
        withdrawal(accountNumber)
    else:
        #GET THE amount value from bank_users
        sqlGet = "SELECT amountValue FROM users_bank WHERE accountNumber = %s"
        varGet = (accountNumber,)
        cursor.execute(sqlGet, varGet)
        result = cursor.fetchone()

        if result and result[0] is not None:
            last_amount_value = result[0]
        else:
            last_amount_value = 0; 
        
        new_amount_value = last_amount_value-amountwithdrawn
        #withdraw the new value by updating it
        cursor.execute("UPDATE users_bank SET amountValue = %s WHERE accountNumber = %s ",(new_amount_value, accountNumber))
        #Record the details of the withdrawal account through separated table 
        sqlRecordAmount  =f"""INSERT INTO `{accountNumber}_BankAccount_Withdraw`(accountNumber, accountWithdrawn, dateWithdrawn) VALUES(%s, %s, %s)"""
        varRecordAmount = (accountNumber, amountwithdrawn, datetime.datetime.now())
        cursor.execute(sqlRecordAmount, varRecordAmount)
        db.commit()
        print(f"The amount of {amountwithdrawn} has been Withdrawn successfully")
        printReceiptForWithdrawal(accountNumber, amountwithdrawn)
        SystemExit()



#Part 4: Deposit
def deposit(accountNumber):
    try:
        amountdeposited = float(input("Enter the amount to deposit: "))
        
        #GET THE amount value from bank_users
        sqlGet = "SELECT amountValue FROM users_bank WHERE accountNumber = %s"
        varGet = (accountNumber,)
        cursor.execute(sqlGet, varGet)
        result = cursor.fetchone()

        if result and result[0] is not None:
            last_amount_value = result[0]
        else:
            last_amount_value = 0; 
        new_amount_value = last_amount_value+amountdeposited
        #deposit the new value by updating it
        sqlupdateAmount  = "UPDATE users_bank SET amountValue = %s WHERE accountNumber = %s "
        varupdateAmount = (new_amount_value, accountNumber)
        cursor.execute(sqlupdateAmount, varupdateAmount)
        #Record the details of the deposited account through separated table 
        sqlRecordAmount  =f"""INSERT INTO `{accountNumber}_BankAccount_Deposit` (accountNumber, accountDeposited, dateDeposited) VALUES(%s, %s, %s)"""
        varRecordAmount = (accountNumber, amountdeposited, datetime.datetime.now())
        cursor.execute(sqlRecordAmount, varRecordAmount)
        db.commit()
        print(f"The amount of {amountdeposited} has been deposited successfully")
        printReceiptForDeposit(accountNumber, amountdeposited)
        SystemExit()
        
    except:
        print("Invaid. Please Try again.")
        select_account_to_manage(accountNumber)
#Part 5: Receipt

def printReceiptForWithdrawal(accountNumber, amountWithdrawn):
    sql = "SELECT lname, fname, amountValue FROM users_bank WHERE accountNumber = %s"
    val = (accountNumber,)
    cursor.execute(sql,val)
    display = cursor.fetchone()
    print("BANK OF THE WORLD: Where money Exist")
    print("Name: ", display[0], " ",display[1])
    print("Amount Withdrawn: ", amountWithdrawn)
    print("Remaining Balance: ", display[2])
    print("Thank you for using BANK OF THE WORLD")
    


def printReceiptForDeposit(accountNumber, amountDeposited):
    sql = "SELECT lname, fname, amountValue FROM users_bank WHERE accountNumber = %s"
    val = (accountNumber,)
    cursor.execute(sql,val)
    display = cursor.fetchone()
    print("BANK OF THE WORLD: Where money Exist")
    print("Name: ", display[0], " ",display[1])
    print("Amount Deposited: ", amountDeposited)
    print("Remaining Balance: ", display[2])
    print("Thank you for using BANK OF THE WORLD")

#First Part
def register():
    fname = input("Enter your First Name: ").strip()
    lname = input("Enter your Last Name: ").strip()
    PIN = str(input("Enter your 6-digit PIN: "))

    pin_number = str(PIN)
    if pin_number.isdigit() and len(pin_number) != 6:
        print("Invalid PIN. Please Try again")
    else:
        official_pin_number = int(pin_number)
        cursor.execute("SELECT accountNumber from users_bank ORDER BY accountNumber DESC LIMIT 1")
        result = cursor.fetchone()

        if result:
            last_Account_Number = result[0]
        else:
            last_Account_Number = 0
        new_Account_Number = last_Account_Number+1
                                
        sqlMainTable = "INSERT INTO users_bank (accountNumber, lname, fname, PIN) VALUES(%s,%s,%s,%s);"
        valMainTable = (new_Account_Number, lname, fname, official_pin_number)

        cursor.execute(sqlMainTable, valMainTable) 
        cursor.execute(f"CREATE TABLE IF NOT EXISTS`{new_Account_Number}_BankAccount_Deposit`(ID INT AUTO_INCREMENT PRIMARY KEY, AccountNumber INT, accountDeposited FLOAT, dateDeposited VARCHAR(50))")
        cursor.execute(f"CREATE TABLE IF NOT EXISTS`{new_Account_Number}_BankAccount_Withdraw`(ID INT AUTO_INCREMENT PRIMARY KEY, AccountNumber INT, accountWithdrawn FLOAT, dateWithdrawn VARCHAR(50))")
        db.commit()
        print(f"Your Account Number is {new_Account_Number}. Please try to Login")


def login():
    try:

        account_number = int(input("Enter you account number: "))
        pin_number = input("Enter your PIN Number: ")

        sql = "SELECT accountNumber, lname, fname, PIN FROM users_bank WHERE accountNumber = (%s)"
        var = (account_number,)
        cursor.execute(sql,var)
        user = cursor.fetchone()
            
        if user is None:
            print("Account Number not found")
        else:
            stored_pinNumber = user[3]
            if pin_number == stored_pinNumber:
                select_account_to_manage(account_number)
            else:
                print("Invalid Pin Number")
    except:
        print("Invalid. Please try logging in again")
        login()

main()