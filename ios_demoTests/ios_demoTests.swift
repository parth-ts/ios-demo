//
//  ios_demoTests.swift
//  ios_demoTests
//
//  Created by Parth Nakum on 19/09/24.
//

import XCTest
@testable import ios_demo // import app
import FirebaseAuth

final class ios_demoTests: XCTestCase {
    
    var loginViewController: LoginViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        loginViewController = LoginViewController()
        // Initialize the loginViewController's IBOutlet properties if needed
        loginViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginViewController = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // create function to test successful login
//    func testSuccessfulLogin() {
//        // Arrange
////        loginViewController.setEmailTextField(text: "test@gmail.com")
////        loginViewController.setPasswordTextField(text: "123456")
//
//        // Act
//        let expectation = self.expectation(description: "Login should succeed")
//        loginViewController.loginClicked(UIButton())
//
//        // Wait for the login process to complete
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Adjust the delay as necessary
//            // Assert (Since we can't directly check the UI in this context, we can check logs)
//            // Ideally, you'd have some way to verify the navigation or state change
//            expectation.fulfill()
//        }
//
//        waitForExpectations(timeout: 10, handler: nil)
//    }
    
    func testSuccessfulLogin() {
        // Arrange
//        loginViewController.emailTextField?.text = "elon@gmail.com" // Use valid test account
//        loginViewController.passwordTextField?.text = "123456"   // Use valid test password

        // Act
        let expectation = self.expectation(description: "Login should succeed")
        loginViewController.loginFunction()

        // Wait for the login process to complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Adjust the delay as necessary
            expectation.fulfill()
        }

        waitForExpectations(timeout: 10)
    }
}


// reference
/*
 let playableAgeRangeCell = PlayableAgeRangeCell()
     
     func testMetersToImperial() {
         XCTAssertEqual(playableAgeRangeCell.convertMetersToImperial(3.5), "11'5\"", "Failed to convert meters to imperial")
         XCTAssertEqual(playableAgeRangeCell.convertMetersToImperial(0.61), "2'0\"", "Failed to convert meters to imperial")
         XCTAssertEqual(playableAgeRangeCell.convertMetersToImperial(2.44), "8'0\"", "Failed to convert meters to imperial")
         XCTAssertEqual(playableAgeRangeCell.convertMetersToImperial(0), "0\"", "Failed to convert meters to imperial for 0 meters")
     }
     
     func testMetersToCentimeters() {
         XCTAssertEqual(playableAgeRangeCell.convertMetersToCentimeters(3.5), "350 cm", "Failed to convert meters to centimeters")
         XCTAssertEqual(playableAgeRangeCell.convertMetersToCentimeters(0), "0 cm", "Failed to convert meters to centimeters for 0 meters")
     }
     
     func testImperialToMeters() {
         XCTAssertEqual(playableAgeRangeCell.convertImperialToMeters("5'6\""), 1.67, accuracy: 0.01, "Failed to convert imperial to meters")
         XCTAssertEqual(playableAgeRangeCell.convertImperialToMeters("2'0\""), 0.61, accuracy: 0.01, "Failed to convert imperial to meters")
         XCTAssertEqual(playableAgeRangeCell.convertImperialToMeters("8'0\""), 2.44, accuracy: 0.01, "Failed to convert imperial to meters")
     }
     
     func testMetricToMeters() {
         XCTAssertEqual(playableAgeRangeCell.convertMetricToMeters("300 cm"), 3.0, "Failed to convert metric to meters")
         XCTAssertEqual(playableAgeRangeCell.convertMetricToMeters("0 cm"), 0, "Failed to convert metric to meters for 0 centimeters")
     }
 */


/*
 reference:
 
 import XCTest
 import FirebaseAuth
 @testable import ios_demo // Replace with your actual module name

 final class ios_demoTests: XCTestCase {
     
     var loginViewController: LoginViewController!

     override func setUpWithError() throws {
         super.setUp()
         loginViewController = LoginViewController()
         
         // Initialize Firebase (make sure Firebase is configured properly)
         // FirebaseApp.configure() // Uncomment this if you have not configured FirebaseApp
     }

     override func tearDownWithError() throws {
         loginViewController = nil
         super.tearDown()
     }

     func testSuccessfulLogin() {
         // Arrange
         loginViewController.emailTextField = UITextField()
         loginViewController.passwordTextField = UITextField()
         loginViewController.emailTextField.text = "test@example.com" // Use valid test account
         loginViewController.passwordTextField.text = "password123"   // Use valid test password

         // Act
         let expectation = self.expectation(description: "Login should succeed")
         loginViewController.loginClicked(UIButton())

         // Wait for the login process to complete
         DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Adjust the delay as necessary
             // Assert (Since we can't directly check the UI in this context, we can check logs)
             // Ideally, you'd have some way to verify the navigation or state change
             expectation.fulfill()
         }

         waitForExpectations(timeout: 10, handler: nil)
     }

     func testFailedLogin() {
         // Arrange
         loginViewController.emailTextField = UITextField()
         loginViewController.passwordTextField = UITextField()
         loginViewController.emailTextField.text = "wrong@example.com" // Invalid test account
         loginViewController.passwordTextField.text = "wrongpassword"   // Invalid password

         // Act
         let expectation = self.expectation(description: "Login should fail")
         loginViewController.loginClicked(UIButton())

         // Wait for the login process to complete
         DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
             // Assert
             // Here you would check logs or the expected outcome
             expectation.fulfill()
         }

         waitForExpectations(timeout: 10, handler: nil)
     }

     func testEmptyFields() {
         // Arrange
         loginViewController.emailTextField = UITextField()
         loginViewController.passwordTextField = UITextField()
         loginViewController.emailTextField.text = ""
         loginViewController.passwordTextField.text = ""

         // Act
         loginViewController.loginClicked(UIButton())

         // Assert
         // You could add assertions here to check for alert messages or similar feedback
         XCTAssertTrue(true, "Should handle empty fields properly.")
     }
 }
 
 */
