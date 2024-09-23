//
//  ios_demoUITestsLaunchTests.swift
//  ios_demoUITests
//
//  Created by Parth Nakum on 19/09/24.
//

import XCTest

final class ios_demoUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        // testing: components exist or not
        let welcomeText = app.staticTexts["Welcome to Spotlight One"]
        XCTAssertTrue(welcomeText.exists)
        
        let loginButtonLaunch = app.buttons["login-button-launch"]
        XCTAssertTrue(loginButtonLaunch.exists)
        XCTAssertEqual(loginButtonLaunch.label, "Login")
        
        let signupButtonLaunch = app.buttons["signup-button-launch"]
        XCTAssertTrue(signupButtonLaunch.exists)
        XCTAssertEqual(signupButtonLaunch.label, "SignUp")
        
        // testing: login button
        testLogin(app: app)
        
        // testing: signup button
        testSignup(app: app)
        
        /*
        let app = XCUIApplication()
        app.launch()

        let loginButton = app.buttons["login-button"]
        XCTAssertTrue(loginButton.exists)
        XCTAssertEqual(loginButton.label, "Login")
    
        loginButton.tap()
        
        XCTAssertTrue(app.staticTexts["Welcome to Spotlight One"].exists)
        
        let emailTextField = app.textFields["t1"]
        XCTAssertTrue(emailTextField.exists)

        emailTextField.tap()
        emailTextField.typeText("hellow@gmail.com")
        
        let password = app.secureTextFields["t-2"]
        password.tap()
        password.typeText("123456")
         
         */
        
    }
    
    // login screen
    func testLogin(app: XCUIApplication) {
        let loginButtonLaunch = app.buttons["Login"]
        loginButtonLaunch.tap()
        
        let welcomeText = app.staticTexts["Welcome to Spotlight One"]
        XCTAssertTrue(welcomeText.exists)
        
        let emailTextField = app.textFields["email-text-field-login"]
        XCTAssertTrue(emailTextField.exists)
        
        let passwordTextField = app.secureTextFields["password-text-field-login"]
        XCTAssertTrue(passwordTextField.exists)
        
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        XCTAssertEqual(loginButton.label, "Login")
        
        emailTextField.tap()
        emailTextField.typeText("hello@gmail.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        
        loginButton.tap()
        
        testHome(app: app)
        
        let backButton = app.buttons["Back"]
        XCTAssert(backButton.exists)
        backButton.tap()
        
    }
    
    // signup screen
    func testSignup(app: XCUIApplication) {
        let signupButtonLaunch = app.buttons["SignUp"]
        signupButtonLaunch.tap()
        
        let welcomeText = app.staticTexts["Welcome to Spotlight One"]
        XCTAssertTrue(welcomeText.exists)
        
        let emailTextField = app.textFields["email-text-field-signup"]
        XCTAssertTrue(emailTextField.exists)
        
        let passwordTextField = app.secureTextFields["password-text-field-signup"]
        XCTAssertTrue(passwordTextField.exists)
        
        let signupButton = app.buttons["SignUp"]
        XCTAssertTrue(signupButton.exists)
        XCTAssertEqual(signupButton.label, "SignUp")
        
        emailTextField.tap()
        emailTextField.typeText("xyz@gmail.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        
        signupButton.tap()

        testHome(app: app)
        
        let backButton = app.buttons["Back"]
        XCTAssert(backButton.exists)
        backButton.tap()
        
    }
    
    // home screen
    func testHome(app: XCUIApplication) {
        let homeScreenText = app.staticTexts["Home Screen"]
        XCTAssertTrue(homeScreenText.exists)
        
        let backButton = app.buttons["Back"]
        XCTAssert(backButton.exists)
        backButton.tap()
    }
}
