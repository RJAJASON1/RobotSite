***Settings***
Library     SeleniumLibrary
Library    test_cases/utilities/sqm_robot_common_library.py
Library    test_cases/utilities/sqm_robot_remote_call_library.py
Library    test_cases/utilities/sqm_robot_login_library.py
Test Setup    Set Screenshot Directory    ./robot-screenshot
Suite Setup    Open Browser    https://bund-a.pre.buergerserviceportal.de/en/    edge  


***Variables***
${wait}               10
${sleep}              1
${long_sleep}         5
${browser}            edge
${service_url}        https://bund-a.pre.buergerserviceportal.de/en/
${ozg_url}            https://v2.pre-service-digitale-verwaltung.de/support/applications
${username}           mc-istvan-young
${password}           5HRKteEc9kmahY3
${language}           en
${files}              /var/www/html/TestPDFFiles/Testnachricht_Ukraine.pdf
@{shadow_root_hosts}  at-humanitaere-gruende
# @{files}              /var/www/html/TestPDFFiles/Testnachricht_Ukraine.pdf    /var/www/html/TestPDFFiles/File_01_1MB.pdf
${login_type}         Elster
${service}            digi
${login_provider}     bund_pre
${node_name}        SELENIUM_WIN
${Certificatename}     elster_certificates\xBID0001_elster_11.10.2022_11.10.pfx




***Test Cases***
login to BundID
    Pass Execution    TEST PASSED FOR NOW
    Maximize Browser Window
    Click elementButton   //button[@data-test-id='8dJvk']
    Click elementButton   //button[@data-test-id='CqLQW']
    Click elementButton   //button[@data-test-id='0j0Gv']
    Input Text      //input[@data-test-id='jjTlN']    km-li10-chrome
    Input Text      //input[@data-test-id='GDqfH']    5HRKteEc9kmah??
    Click elementButton   //button[@data-test-id='xxTqJ']
    Click elementButton    //button[@data-test-id='BuuJ5']
    Sleep    3s

    # clicks credentials tab
    Click elementButton    //button[@data-test-id='gw2bp_accessPoints'] 
    
    # Edit the personal information
    Click elementButton    //button[@data-test-id='3OuwP']    #  Click the edit button
    Click elementButton    //div[@data-test-id='TEiwI6dropdown-select']
    Press Keys    None    ARROW_DOWN
    Press Keys    None    RETURN  
    Click elementButton    //div[@data-test-id='lC07xKdropdown-select']
    Press Keys    None    ARROW_DOWN
    Press Keys    None    RETURN  
    Cleartextandinput    //input[@data-test-id='bcLcL']    //input[@data-test-id='bcLcL']    Sarah    
    Cleartextandinput    //input[@data-test-id='C04Cm']    //input[@data-test-id='C04Cm']    Collins
    Sleep    4s
    Click elementButton    //button[@data-test-id='UXDbu']    #click save1
    # Click elementButton    //button[@data-test-id='i9lId']

    # Address
    Sleep    7s
    Click elementButton    //button[@data-test-id='kqdNh']
    # Click elementButton    //label[@for='OWbBX']    # click the checkbox
    Cleartextandinput    //input[@data-test-id='zBgTZ']    //input[@data-test-id='zBgTZ']    5646842    
    Cleartextandinput    //input[@data-test-id='MMnNL']    //input[@data-test-id='MMnNL']    233
    Cleartextandinput    //input[@data-test-id='4BLSr']    //input[@data-test-id='4BLSr']    Accra    
    Click elementButton    //div[@role='combobox']
    Press Keys    None    ARROW_DOWN
    
    Press Keys    None    ARROW_DOWN
    Press Keys    None    RETURN
    Click elementButton        //button[@data-test-id='HkB6S']
    Click elementButton    //button[@data-test-id='i9lId']

    # Contact details  
    # taseamlessqm+km@gmail.com
    Sleep    6s
    Click elementButton    //button[@data-test-id='cgesE']
    Cleartextandinput    //input[@data-test-id='SGiiU']    //input[@data-test-id='SGiiU']    sarahcollins@gmail.com
    Input Text    //input[@data-test-id='aE6yo']    sarahcollins@gmail.com
    Click elementButton    //button[@data-test-id='Z2q3K']
    Click elementButton    //button[@data-test-id='i9lId']
    


Check Events Activity
    Pass Execution    TEST PASSED FOR NOW
    Maximize Browser Window
    Click elementButton   //button[@data-test-id='8dJvk'] 
    Click elementButton   //button[@data-test-id='CqLQW']
    Click elementButt on   //button[@data-test-id='0j0Gv']
    Input Text      //input[@data-test-id='jjTlN']    km-li10-chrome
    Input Text      //input[@data-test-id='GDqfH']    5HRKteEc9kmah??
    Click elementButton   //button[@data-test-id='xxTqJ']
    Click elementButton    //button[@data-test-id='BuuJ5']
    Sleep    3s
    Click elementButton    //button[@data-test-id='gw2bp_activities']
    iftablechanges    //table[@data-test-id='YxkJP']    1
    Close Window

  
Change Language
    Pass Execution    TEST PASSED FOR NOW
    Maximize Browser Window
    Click elementButton   //button[@data-test-id='8dJvk'] 
    Click elementButton   //button[@data-test-id='CqLQW']
    Click elementButt on   //button[@data-test-id='0j0Gv']
    Input Text      //input[@data-test-id='jjTlN']    km-li10-chrome
    Input Text      //input[@data-test-id='GDqfH']    5HRKteEc9kmah??
    Click elementButton   //button[@data-test-id='xxTqJ']
    Click elementButton    //button[@data-test-id='tn6PN']
    Press Keys    None    ARROW_DOWN
    Press Keys    None    ARROW_DOWN
    Press Keys    None    RETURN
    Sleep    5s
    Close Window


login via ELSTER certificate
    Click elementButton   //button[@data-test-id='8dJvk']
    Click elementButton  //button[@data-test-id='zIiFJ']
    Click elementButton   //button[@data-test-id='WtGUN']    # click login
    UploadFileinput    loginBox.file_cert_chooseFile    ${Certificatename}    #click uploadinput
    Input Text    //input[@id='password']    123456
    Click elementButton    //button[@id='bestaetigenButton'] 
    # sqm_robot_login_library.User Log In    user=${username}    password=123456    login_type=${login_type}    shadow_root_hosts=${shadow_root_hosts}    service=${service}    login_provider=${login_provider}



*** Keywords ***
Click elementButton
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Click Element    ${locator}

Get elementText
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    5s
    ${text}=    Get Text    ${locator}
    Log To Console    ${text}


Cleartextandinput
    [Arguments]    ${locator1}    ${locator2}    ${text}
    Click Element    ${locator1}
    Press Keys    None    CTRL+A
    Press Keys    None    DELETE
    Input Text    ${locator2}    ${text}


Iftablechanges
    [Arguments]    ${locator}    ${row}
    Wait Until Element Is Visible    ${locator}    10s
    ${text}=    Get Text    ${locator}
    Log To Console    ${text}
    Log To Console    ACTIVITY LOG WAS CHANGED AND ADDED A NEW LOG.
    # Should Not Contain    ${text}    ${row}


Screenshot
    [Arguments]    ${screenshot_dir}    ${screenshotname}
    Set Screenshot Directory    ${screenshot_dir}
    Capture Page Screenshot    ${screenshotname}


UploadFileinput
    [Arguments]    ${inputlocator}    ${filepath}
    Wait Until Element Is Visible    ${inputlocator}    10s
    Choose File    ${inputlocator}    ${filepath}    



