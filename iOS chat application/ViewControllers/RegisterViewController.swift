import UIKit

class RegisterViewController: UIViewController {
    private lazy var image: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(imageLiteralResourceName: "telegram_icon.png")
        return view
    }()
    
    private lazy var register: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor("#96ADFB")
        btn.addTarget(self, action: #selector(handleRegisterAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor("#232323", alpha: 0.050)
        textField.layer.cornerRadius = 25
        textField.setLeftPadding()
        textField.clearButtonMode = .whileEditing
        textField.tintColor = .black
        textField.placeholder = "Enter your email"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor("#232323", alpha: 0.050)
        textField.layer.cornerRadius = 25
        textField.setLeftPadding()
        textField.clearButtonMode = .whileEditing
        textField.tintColor = .black
        textField.placeholder = "Enter your password"
        return textField
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewAppearance()
        
        view.addSubview(image)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(register)
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -20),
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 50),
            
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            register.heightAnchor.constraint(equalToConstant: 50),
            register.widthAnchor.constraint(equalToConstant: 100),
            register.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            register.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        register.layer.cornerRadius = 20
    }
    
    // MARK: - Private Methods
    private func setViewAppearance() {
        view.backgroundColor = UIColor("#C3CDEF")
        
        navigationItem.title = "Register"
        navigationController?.navigationBar.tintColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor("#5D7FF2")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    @objc private func handleRegisterAction() {
        // call Api
    }
}
