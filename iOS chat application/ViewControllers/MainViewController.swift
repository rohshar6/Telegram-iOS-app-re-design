import UIKit

class MainViewController: UIViewController {
    // MARK: - Views
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.appName
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    private lazy var image: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(imageLiteralResourceName: "telegram_icon.png")
        return view
    }()
    
    private lazy var registerButton: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor("#96ADFB")
        btn.addTarget(self, action: #selector(handleRegisterAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor("#9896FB")
        btn.addTarget(self, action: #selector(handleLoginAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [registerButton, loginButton])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = Constants.appName
        view.backgroundColor = UIColor("#5D7FF2")
        
        view.addSubview(label)
        view.addSubview(image)
        view.addSubview(stackView)
        addConstraint()
        registerButton.layer.cornerRadius = 20
        loginButton.layer.cornerRadius = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Private Methods
    private func addConstraint() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func handleRegisterAction() {
        let vc = ViewControllerFactory.shared.makeRegisterViewController()
        show(vc, sender: self)
    }
    
    @objc private func handleLoginAction() {
        let vc = ViewControllerFactory.shared.makeLoginViewController()
        show(vc, sender: self)
    }
}
