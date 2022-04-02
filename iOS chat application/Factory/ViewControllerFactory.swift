import UIKit

class ViewControllerFactory {
    static let shared = ViewControllerFactory()
    
    func makeLoginViewController() -> UIViewController {
        return LoginViewController()
    }
    
    func makeRegisterViewController() -> UIViewController {
        return RegisterViewController()
    }
}
