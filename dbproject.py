# Ben Tunney
# CS3200
# April 20, 2022
# Final Project

import pymysql

host = 'localhost'
database = 'dci'

def connector(username, password):
    """
    Parameters
    ----------
    hostname : string
        user-input username
    password : string
        user-input password

    Returns
    -------
    cnx : connection
        pymysql connection

    """
    cnx = pymysql.connect(host= host, user = username,
                              password= password,
                          db= database, charset='utf8mb4',
                              cursorclass=pymysql.cursors.DictCursor)
    return cnx

def error(e):
    # return nothing when invalid user/password error occurs
    print()
    print('Error: %d: %s' % (e.args[0], e.args[1]))
    return

def create(cnx):
    
    print()
    print()
    print()
    print()
    # use contreadtable to continue create commands until user prompts otherwise
    contreadtable = True
    while contreadtable == True:
        
        # prompt user to enter a table 1-5
        print("WHICH TABLE WOULD YOU LIKE TO CREATE A TUPLE FOR?")
        print("                  (1) SHOWSITE ")
        print("                  (2) DCI SHOW ")
        print("                  (3) DRUM CORPS ")
        print("                  (4) PERFORMANCE DATA ")
        print("                  (5) PROPS ")
        print()
        readchoice = input("ENTER # (1-5): ")
        readchoice = int(readchoice)
        
        # if/else statements for each table
        # each if/else takes and cleans input data and calls create procedure
        if readchoice == 3:
            
            corps = input("CORPS NAME? ")
            program = input("PROGRAM NAME? ")
            year = input("WHAT YEAR? ")
            
            corps = corps.lower()
            corps = corps.title()
            program = program.lower()
            program = program.title()
            
            cursor = cnx.cursor()
            cursor.callproc("createCorps",(corps,program,year))
            
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 1:
            sid = input("SHOW ID? ")
            street = input("STREET NAME? ")
            zipcode = input("ZIPCODE? ")
            state = input("STATE? ")
            city = input("CITY? ")
            capacity = input("SPECTATOR CAPACITY? ")
            
            street = street.lower()
            street = street.title()
            state = state.lower()
            state = state.title()
            city = city.lower()
            city = city.title()
            
            cursor = cnx.cursor()
            cursor.callproc("createShowsite",(sid, street, zipcode, 
                                              state, city, capacity))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 2:
            corps = input("CORPS NAME? ")
            date = input("DATE? EX: (0000-00-00 Y-M-D)")
            weather = input("WEATHER DESCRIPTION?")
            attendance = input("TOTAL ATTENDANCE NUMBER? ")
            sid = input("SHOW ID? ")
            street = input("STREET NAME? ")
            state = input("STATE? ")
            city = input("CITY? ")
            
            street = street.lower()
            street = street.title()
            state = state.lower()
            state = state.title()
            city = city.lower()
            city = city.title()
            corps = corps.lower()
            corps = corps.title()
            
            cursor = cnx.cursor()
            cursor.callproc("createDcishow",(corps, date, weather, attendance,
                                             sid, street, city, state))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 4:
            placement = input("PLACEMENT NUMBER? EX: (4) ")
            musicscore = input("MUSIC SCORE? EX: (94.2) ")
            visualscore = input("VISUAL SCORE? EX: (92.2) ")
            totalscore = input("TOTAL SCORE? EX: (90.2) ")
            corps = input("CORPS NAME? ")
            date = input("PERFORMANCE DATE? EX: (0000-00-00 Y-M-D)")
            program = input("PROGRAM NAME? ")
            sid = input("SHOW ID? ")
            street = input("STREET NAME? ")
            city = input("CITY? ")
            year = input("YEAR? ")
            
            
            street = street.lower()
            street = street.title()
            city = city.lower()
            city = city.title()
            corps = corps.lower()
            corps = corps.title()
            program = program.lower()
            program = program.title()
            
            cursor = cnx.cursor()
            cursor.callproc("createPerformancedata",(placement, 
                                                    musicscore, visualscore,
                                             totalscore, corps, sid, date,
                                             program, year, street, city))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 5:
            pid = input("PROP ID? ")
            desc = input("PROP DESCRIPTION? ")
            corps = input("CORPS NAME? ")
            program = input("PROGRAM NAME? ")
            year = input("WHAT YEAR? ")
            
            corps = corps.lower()
            corps = corps.title()
            program = program.lower()
            program = program.title()
            
            cursor = cnx.cursor()
            cursor.callproc("createProp",(pid, desc, corps,program,year))
            
            # close first cursor
            cursor.close() 
            print()
        
        # prompt user to enter value 1-5
        else:
            print()
            print()
            print()
            print()
            print("ERROR: PLEASE ENTER A VALID VALUE: 1-5")
            print()
            continue
        
        print("SUCCESSFUL CREATE")
        print()
        
        # prompt user to enter only y/n to continue loop
        valid = False
        while valid == False:
            print("WOULD YOU LIKE TO CREATE ANOTHER TUPLE?")
            tf = str(input("ENTER Y/N: ")).lower()
            if tf == "y":
                contreadtable = True
                break
            elif tf == "n":
                contreadtable = False
                print()
                print()
                print()
                break
            else:
                print("ERROR: PLEASE ENTER A VALID VALUE: Y/N")
                continue
                
            print()

def readQuery(query, cnx):
    
    print()
    cur1 = cnx.cursor()
        
    # execute query for all data in table
    cur1.execute(query)

    # fetch all pairs
    rows = cur1.fetchall()
    
    # return dictionary of data
    for row in rows:
        print(row)
        print()
    
    # close first cursor
    cur1.close() 
    
    if not rows:
        print("NO AVAILABLE DATA IN THIS TABLE")
        
def tableread(cnx):
    
    # list for valid options
    tablelst = ["dci shows", "show sites", "drum corps", 
                   "performance information", "corps members", 
                   "prop information", "show music", 
                   "drum corps equipment"]
    print()
    print()
    print("AVAILABLE TABLES: DCI SHOWS")
    print("                  SHOW SITES")
    print("                  DRUM CORPS")
    print("                  PERFORMACE INFORMATION")
    print("                  CORPS MEMBERS")
    print("                  PROP INFORMATION")
    print("                  SHOW MUSIC")
    print("                  DRUM CORPS EQUIPMENT")
    print()
    
    # prompt user to enter table option
    tablechoice = input("ENTER A VALID TABLE NAME: ").lower()
    print()
    
    if tablechoice in tablelst:
        
        # print data from if/else statements for specified table
        print("ALL AVAILABLE DATA FOR", tablechoice, ":")
        print()
        
        if tablechoice == "dci shows":
            query = "CALL readDcishow();"
            readQuery(query, cnx)
            
        elif tablechoice == "show sites":
            query = "CALL readShowsite();"
            readQuery(query, cnx)
            
        elif tablechoice == "drum corps":
            query = "CALL readDrumcorps();"
            readQuery(query, cnx)
            
        elif tablechoice == "performance information":
            query = "CALL readPerformancedata();"
            readQuery(query, cnx)
            
        elif tablechoice == "corps members":
            query = "CALL readMember();"
            readQuery(query, cnx)
            
        elif tablechoice == "prop information":
            query = "CALL readProp();"
            readQuery(query, cnx)
            
        elif tablechoice == "show music":
            query = "CALL readMusic_piece();"
            readQuery(query, cnx)
            
        elif tablechoice == "drum corps equipment":
            query = "CALL readEquipment();"
            readQuery(query, cnx)
            
        print()
        print()
            
        # ask user if they want to read another table
        # reprompt user to enter valid if invalid
        valid = False
        while valid == False:
            print("WOULD YOU LIKE TO READ ANOTHER TABLE?")
            tf = str(input("ENTER Y/N: ")).lower()
            if tf == "y":
                contreadtable = True
                break
            elif tf == "n":
                contreadtable = False
                print()
                print()
                print()
                break
            else:
                print("ERROR: PLEASE ENTER A VALID VALUE: Y/N")
                continue
                
            print()
        
    else:
        print()
        print()
        print()
        print()
        print()
        print("-------------------------------------------")
        print(" ERROR: PLEASE ENTER A VALID TABLE")
        print("-------------------------------------------")
        print()
        print()
        contreadtable = True
        
    return contreadtable

def queryread(cnx):
    
    # display available queries
    print()
    print()
    print("AVAILABLE QUERIES: (1) SEASON PERFORMANCE FOR SPECIFIC DRUM CORPS/YEAR")
    print("                   (2) ALL MEMBERS FROM A SPECIFIED CORPS/SECTION")
    print("                   (3) ALL SHOWS FROM SPECIFIED YEAR/STATE")
    print("                   (4) CURRENT AGE-ELIGIBLE MEMBERS")
    print("                   (5) SHOW MUSIC WITH SPECIFIED COMPOSER")
    print("                   (6) FULL LIST OF PROPS USED BY A DRUM CORPS")
    print("                   (7) LIST OF CITIES HOSTING SHOWS FOR SPECIFIED YEAR")

# prompt user to enter valid query option (1-7)
    querychoice = int(input("ENTER A VALID QUERY (1-7): "))
    print()
    if querychoice in range(1,8):
        
        print("ALL AVAILABLE DATA FOR QUERY #", querychoice, ":")
        print() 
        
        # using if/else return data for specified query
        # display valid options prior to prompting for values
        if querychoice == 1:
            
            c = cnx.cursor()
            c.execute("SELECT name FROM drumcorps")
            rows = c.fetchall()
            lst = []
            for row in rows:
                lst.append(row)
            
            c.close() 
            c = cnx.cursor()
            c.execute("SELECT DISTINCT year FROM drumcorps")
            rows = c.fetchall()
            plst = []
            for row in rows:
                plst.append(row)
            
            c.close() 
            
            print("AVAILABLE CORPS LIST:", lst)
            print()
            print("AVAILABLE YEARS LIST:", plst)
            
            year = input("WHAT YEAR WOULD YOU LIKE SHOW DATA FOR? ")
            corps = input("WHAT CORPS? ")
            corps = corps.lower()
            corps = corps.title()
            cursor = cnx.cursor()
            cursor.callproc("readCorpsseason",(corps,year))
            print()
            rows = cursor.fetchall()
            
            for row in rows:
                print(row)
                print()
            
            # close first cursor
            cursor.close() 
            print()
            
        
        elif querychoice == 2:
            
            c = cnx.cursor()
            c.execute("SELECT DISTINCT section FROM member")
            rows = c.fetchall()
            lst = []
            for row in rows:
                lst.append(row)
            
            c.close() 
            c = cnx.cursor()
            c.execute("SELECT name FROM drumcorps")
            rows = c.fetchall()
            plst = []
            for row in rows:
                plst.append(row)
            
            c.close() 
            
            print("AVAILABLE SECTION LIST:", lst)
            print()
            print("AVAILABLE CORPS LIST:", plst)
            
            section = input("WHAT CORPS SECTION? ")
            section = section.lower()
            section = section.capitalize()
            corps = input("WHAT CORPS? ")
            corps = corps.lower()
            corps = corps.title()
            cursor = cnx.cursor()
            cursor.callproc("readCorpsmembers",(corps, section))
            print()
            rows = cursor.fetchall()
            
            for row in rows:
                print(row)
                print()
            
            # close first cursor
            cursor.close() 
            print()
        
        elif querychoice == 3:
            c = cnx.cursor()
            c.execute("SELECT DISTINCT year FROM drumcorps")
            rows = c.fetchall()
            lst = []
            for row in rows:
                lst.append(row)
            
            c.close() 
            c = cnx.cursor()
            c.execute("SELECT DISTINCT state FROM showsite")
            rows = c.fetchall()
            plst = []
            for row in rows:
                plst.append(row)
            
            c.close() 
            
            print("AVAILABLE YEARS LIST:", lst)
            print()
            print("AVAILABLE STATES LIST:", plst)
            
            year = int(input("WHAT YEAR WOULD YOU LIKE SHOW DATA FOR? "))
            state = input("WHAT STATE (ENTER FULL STATE NAME)? ")
            state.upper()
            cursor = cnx.cursor()
            cursor.callproc("readSeason", (year, state))
            print()
            rows = cursor.fetchall()
            
            for row in rows:
                print(row)
                print()
                
            # close first cursor
            cursor.close() 
            print()
        
        elif querychoice == 4:
            cursor = cnx.cursor()
            cursor.callproc("readEligible")
            print()
            rows = cursor.fetchall()
            
            for row in rows:
                print(row)
                print()
                
            # close first cursor
            cursor.close() 
            print()
        
        
        elif querychoice == 5:
            c = cnx.cursor()
            c.execute("SELECT DISTINCT composer FROM music_piece")
            rows = c.fetchall()
            lst = []
            for row in rows:
                lst.append(row)
            
            c.close() 
            
            print("AVAILABLE COMPOSER LIST:", lst)
            
            composer = input("WHAT COMPOSER'S SHOW MUSIC? ")
            composer = composer.lower()
            composer = composer.title()
            cursor = cnx.cursor()
            cursor.callproc("readMusicbycomposer", (composer,))
            print()
            rows = cursor.fetchall()
            
            for row in rows:
                print(row)
                print()
                
            # close first cursor
            cursor.close() 
            print()
        
        
        elif querychoice == 6:
            c = cnx.cursor()
            c.execute("SELECT name FROM drumcorps")
            rows = c.fetchall()
            plst = []
            for row in rows:
                plst.append(row)
            
            c.close() 
            
            print("AVAILABLE CORPS LIST:", plst)
            
            corps = input("WHAT CORP'S PROPS? ")
            corps = corps.lower()
            corps = corps.title()
            cursor = cnx.cursor()
            cursor.callproc("readCorpsprop", (corps,))
            print()
            rows = cursor.fetchall()
            
            for row in rows:
                print(row)
                print()
                
            # close first cursor
            cursor.close() 
            print()
        
        elif querychoice == 7:
            
            c = cnx.cursor()
            c.execute("SELECT DISTINCT year FROM drumcorps")
            rows = c.fetchall()
            lst = []
            for row in rows:
                lst.append(row)
            
            c.close() 
            
            
            print("AVAILABLE YEARS LIST:", lst)
            print()
            
            year = input("WHAT YEAR'S CITIES? ")
            cursor = cnx.cursor()
            
            cursor.callproc("readShowcities", (year,))
            print()
            rows = cursor.fetchall()
            
            for row in rows:
                print(row)
                print()
                
            # close first cursor
            cursor.close() 
            print()
        
        # ask user if they want to read another
        print()
        print()
        valid = False
        while valid == False:
            print("WOULD YOU LIKE TO READ ANOTHER TABLE?")
            tf = str(input("ENTER Y/N: ")).lower()
            print()
            if tf == "y":
                contreadtable = True
                break
            elif tf == "n":
                contreadtable = False
                print()
                print()
                print()
                break
            else:
                print("ERROR: PLEASE ENTER A VALID VALUE: Y/N")
                continue
                
            print()
            
            
    # reprompt for valid table entry
    else:
        print()
        print()
        print()
        print()
        print()
        print("-------------------------------------------")
        print(" ERROR: PLEASE ENTER A VALID TABLE")
        print("-------------------------------------------")
        print()
        print()
        contreadtable = True
        
    return contreadtable
        

def read(cnx):
    
    # home for read operations
    print()
    print()
    print()
    print()
    
    # while loop to continue until user stops requesting reads
    contreadtable = True
    while contreadtable == True:
        print("WOULD YOU LIKE TO (1) READ FROM A TABLE ")
        print("                  (2) REQUEST A SPECIFIC QUERY")
        print()
        readchoice = int(input("ENTER 1 OR 2: "))
        
        if readchoice == 1:
            contreadtable = tableread(cnx)
        elif readchoice == 2:
            contreadtable = queryread(cnx)
        else:
            print()
            print()
            print()
            print()
            print("ERROR: PLEASE ENTER A VALID VALUE: 1 OR 2")
            print()
            continue
        
            
def update(cnx):
    
    print()
    print()
    print()
    print()
    
    # prompt user with update options
    contreadtable = True
    while contreadtable == True:
        print("WHICH UPDATE WOULD YOU LIKE TO MAKE?")
        print("                  (1) CHANGE MEMBER'S SECTION")
        print("                  (2) UPDATE MEMBER'S YEAR ")
        print("                  (3) RENAME DRUM CORPS'S PROGRAM ")
        print("                  (4) UPDATE SHOW SCORES ")
        print("                  (5) CHANGE SHOW LOCATION ")
        print("                  (6) CHANGE SHOW CAPACITY ")
        print("                  (7) UPDATE PROP DESCRIPTION ")
        print("                  (8) UPDATE SHOW ATTENDANCE ")
        print("                  (9) UPDATE SHOW WEATHER ")
        print()
        readchoice = int(input("ENTER # (1-9): "))
        
        # if/else for each update
        # data entry and cleaning, call specified proceudure
        if readchoice == 1:
            section = input("NEW MEMBER'S SECTION? ")
            name = input("MEMBER'S NAME? ")
            dob = input("MEMBER'S DATE OF BIRTH? EX: (0000-00-00 Y-M-D)")
            
            section = section.lower()
            section = section.title()
            name = name.lower()
            name = name.title()
            
            cursor = cnx.cursor()
            cursor.callproc("updateMemberSection",(section, name, dob))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 2:
            years = input("UPDATED MEMBER'S YEARS OF EXPERIENCE? ")
            name = input("MEMBER'S NAME? ")
            dob = input("MEMBER'S DATE OF BIRTH? EX: (0000-00-00 Y-M-D)")
            
            name = name.lower()
            name = name.title()
            
            cursor = cnx.cursor()
            cursor.callproc("updateMemberYears",(years, name, dob))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 3:
            program = input("UPDATED SHOW NAME? ")
            corps = input("CORPS NAME? ")
            year = input("YEAR? ")
            
            
            program = program.lower()
            program = program.title()
            corps = corps.lower()
            corps = corps.title()
            
            cursor = cnx.cursor()
            cursor.callproc("updateCorpsprogram",(program, corps, year))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 4:
            placement = input("NEW PLACEMENT NUMBER? EX: (4) ")
            musicscore = input("NEW MUSIC SCORE? EX: (94.2) ")
            visualscore = input("NEW VISUAL SCORE? EX: (92.2) ")
            totalscore = input("NEW TOTAL SCORE? EX: (90.2) ")
            corps = input("CORPS NAME? ")
            sid = input("SHOW ID? ")
            
            corps = corps.lower()
            corps = corps.title()
            
            cursor = cnx.cursor()
            cursor.callproc("createPerformancedata",(placement, 
                                                    musicscore, visualscore,
                                             totalscore, sid, corps))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 5:
            street = input("NEW STREET NAME? ")
            zipcode = input("NEW ZIPCODE? ")
            state = input("NEW STATE? ")
            city = input("NEW CITY? ")
            sid = input("SHOW ID? ")
            
            street = street.lower()
            street = street.title()
            state = state.lower()
            state = state.title()
            city = city.lower()
            city = city.title()
            
            cursor = cnx.cursor()
            cursor.callproc("updateShowLoc",(street, zipcode, state, city,
                                             sid))
            
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 6:
            capacity = input("NEW SHOW CAPACITY? ")
            sid = input("SHOW ID? ")
            
            
            cursor = cnx.cursor()
            cursor.callproc("updateShowCapacity",(capacity, sid))
            
            # close first cursor
            cursor.close() 
            print()
            
            
        elif readchoice == 7:
            desc = input("UPDATED PROP DESCRIPTION? ")
            program = input("SHOW NAME? ")
            corps = input("CORPS NAME? ")
            
            program = program.lower()
            program = program.title()
            corps = corps.lower()
            corps = corps.title()
            
            cursor = cnx.cursor()
            cursor.callproc("updateProp",(desc, corps, program))
            
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 8:
            attendance = input("UPDATED SHOW ATTENDANCE? ")
            sid = input("SHOW ID? ")
            
            cursor = cnx.cursor()
            cursor.callproc("updateAttendance",(attendance, sid))
            
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 9:
            weather = input("UPDATED SHOW WEATHER? ")
            sid = input("SHOW ID? ")
            
            cursor = cnx.cursor()
            cursor.callproc("updateWeather",(weather, sid))
            
            # close first cursor
            cursor.close() 
            print()
            
        else:
            print()
            print()
            print()
            print()
            print("ERROR: PLEASE ENTER A VALID VALUE: 1-9")
            print()
            continue
        
        print("SUCCESSFUL UPDATE")
        print()
        
        # ask user if they want another update
        valid = False
        while valid == False:
            print("WOULD YOU LIKE TO UPDATE ANOTHER TUPLE?")
            tf = str(input("ENTER Y/N: ")).lower()
            if tf == "y":
                contreadtable = True
                break
            elif tf == "n":
                contreadtable = False
                print()
                print()
                print()
                break
            else:
                print("ERROR: PLEASE ENTER A VALID VALUE: Y/N")
                continue
                
            print()

def delete(cnx):
    
    print()
    print()
    print()
    print()
    
    # loop for continuing delete operations
    contreadtable = True
    while contreadtable == True:
        
        # prompt user for specified delete operations
        print("WHICH DELETE WOULD YOU LIKE TO MAKE?")
        print("                  (1) DELETE SHOW")
        print("                  (2) REMOVE MEMBER")
        print("                  (3) DELETE SHOW MUSIC ")
        print("                  (4) DELETE PROP ")
        print("                  (5) DELETE SHOWSITE ")
        print()
        readchoice = input("ENTER # (1-5): ")
        readchoice = int(readchoice)
        
        # if/else statements with data entry and called delete proced
        # ure for specified request
        if readchoice == 1:
            sid = input("SHOW ID OF SHOW TO DELETE? ")
            
            cursor = cnx.cursor()
            cursor.callproc("deleteDcishow",(sid,))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 2:
            corps = input("DRUM CORPS NAME TO DELETE? ")
            
            corps = corps.lower()
            corps = corps.title()
            
            cursor = cnx.cursor()
            cursor.callproc("deleteDrumcorps",(corps,))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 3:
            name = input("MEMBER NAME TO DELETE? ")
            dob = input("MEMBER'S DATE OF BIRTH? EX: (0000-00-00 Y-M-D) ")
            
            name = name.lower()
            name = name.title()
            
            cursor = cnx.cursor()
            cursor.callproc("deleteMember",(name, dob))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 4:
            music = input("MUSIC PIECE TO DELETE? ")
            composer = input("COMPOSER'S NAME? ")
            
            music = music.lower()
            music = music.title()
            composer = composer.lower()
            composer = composer.title()
            
            cursor = cnx.cursor()
            cursor.callproc("deleteMusicpiece",(music, composer))
            # close first cursor
            cursor.close() 
            print()
            
        elif readchoice == 5:
            pid = input("PROP ID OF PROP TO DELETE? ")
            
            cursor = cnx.cursor()
            cursor.callproc("deleteProp",(pid,))
            # close first cursor
            cursor.close() 
            print()
            
        
        
        # reprompt for valid value
        else:
            print()
            print()
            print()
            print()
            print("ERROR: PLEASE ENTER A VALID VALUE: 1-5")
            print()
            continue
        
        print("SUCCESSFUL DELETE")
        
        # ask user if they want to delete again
        valid = False
        while valid == False:
            print("WOULD YOU LIKE TO DELETE ANOTHER TUPLE?")
            tf = str(input("ENTER Y/N: ")).lower()
            if tf == "y":
                contreadtable = True
                break
            elif tf == "n":
                contreadtable = False
                print()
                print()
                print()
                break
            else:
                print("ERROR: PLEASE ENTER A VALID VALUE: Y/N")
                continue
                
            print()

def main():

    print()
    print()
    username = input("Enter MySQL username: ")
    password = input("Enter MySQL password: ")
    print()
    print()
    print()
    try:
        # connection to dci database using provided username 
        # and password values
        cnx = connector(username, password)
        
    except pymysql.err.OperationalError as e:
        # if input username/password is invalid stop program
        return error(e)

    try:
      
        cnx = connector(username, password)
        
    except pymysql.err.OperationalError as e:
        # if input username/password is invalid stop program
        return error(e)
        
    
    try:
        
        # display main menu
        print()
        print()
        print("----------------------------------------")
        print("   SUCCESSFUL ENTRY - DCI DATABASE")
        print("----------------------------------------")
        print()
        print()
        print("AVAILABLE DATA FOR: DCI SHOWS, SHOW SITES, DRUM CORPS,")
        print("                    PERFORMANCE DATA, SHOW PROPS, SHOW MUSIC")
        print("                    EQUIPMENT, AND CORPS MEMBERS")
        print()
        print()
        print()
        
        # loop for chooosing CRUD or exit operation
        cont = True
        while cont == True:
            print("WHICH FUNCTIONALITY WOULD YOU LIKE TO USE?")
            print()
            optionalitylst = ["create", "read", "update", "delete", "exit database"]
            optionality = input("ENTER CREATE, READ, UPDATE, DELETE, OR EXIT DATABASE: ")
            optionality = optionality.lower()
            if optionality not in optionalitylst:
                print()
                print()
                print()
                print()
                print()
                print()
                print("-------------------------------------------")
                print(" ERROR: PLEASE ENTER A VALID FUNCTIONALITY")
                print("-------------------------------------------")
                print()
                print()
                continue
            
            # call specified option
            if optionality == "create":
                create(cnx)
                
            elif optionality == "read":
                read(cnx)
                
            elif optionality == "update":
                update(cnx)
                
            elif optionality == "delete":
                delete(cnx)
            
            # end program if requested
            elif optionality == "exit database":
                print()
                print("THANK YOU GOOD BYE")
                print()
                cont = False
                

    
    except pymysql.Error as e:
        # if input username/password is invalid stop program
        return error(e)

    finally:
        # close connection to db
        cnx.close()
    
    
if __name__ == "__main__":
    main()
    
    
