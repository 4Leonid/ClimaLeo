//
//  ViewController.swift
//  ClimaLeo
//
//  Created by Леонид Турко on 18.05.2023.
//

import SwiftUI
import SnapKit

class ViewController: UIViewController {
  //  MARK: - UI Elements
  private lazy var emptyView: UIView = {
    let element = UIView()
    return element
  }()
  
  private lazy var backgroundImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "background")
    element.contentMode = .scaleAspectFill
    return element
  }()
  
  private lazy var weatherImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(systemName: "sun.max")
    element.tintColor = .black
    element.contentMode = .scaleAspectFill
    return element
  }()
  
  private lazy var mainVertStack: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.alignment = .trailing
    element.distribution = .fill
    element.spacing = 10
    return element
  }()
  
  private lazy var horisontalTopStack: UIStackView = {
    let element = UIStackView()
    element.axis = .horizontal
    element.distribution = .fill
    element.alignment = .fill
    element.spacing = 10
    return element
  }()
  
  private lazy var horisontalMidleStack: UIStackView = {
    let element = UIStackView()
    element.axis = .horizontal
    element.distribution = .fill
    element.alignment = .fill
    element.spacing = 0
    return element
  }()
  
  private lazy var numberLabel: UILabel = {
    let element = UILabel()
    element.text = "21"
    element.font = UIFont.systemFont(ofSize: 80, weight: .black)
    return element
  }()
  
  private lazy var celceLabel: UILabel = {
    let element = UILabel()
    element.text = "°"
    element.font = UIFont.systemFont(ofSize: 100, weight: .light)
    return element
  }()
  
  private lazy var cLabel: UILabel = {
    let element = UILabel()
    element.text = "C"
    element.font = UIFont.systemFont(ofSize: 100, weight: .light)
    return element
  }()
  
  private lazy var cityLabel: UILabel = {
    let element = UILabel()
    element.text = "London"
    element.font = UIFont.systemFont(ofSize: 30)
    return element
  }()
  
  private lazy var placeButton: UIButton = {
    let element = UIButton(type: .system)
    let image = UIImage(systemName: "location.circle.fill")
    element.setBackgroundImage(image, for: .normal)
    element.tintColor = .black
    return element
  }()
  
  private lazy var surchButton: UIButton = {
    let element = UIButton(type: .system)
    let image = UIImage(systemName: "magnifyingglass")
    element.setBackgroundImage(image, for: .normal)
    element.tintColor = .black
    return element
  }()
  
  private lazy var surchTextField: UITextField = {
    let element = UITextField()
    element.font = UIFont.systemFont(ofSize: 25)
    element.backgroundColor = #colorLiteral(red: 0.575001657, green: 0.7453439832, blue: 0.7670161128, alpha: 1)
    element.placeholder = "Search"
    element.textAlignment = .right
    element.borderStyle = .roundedRect
    element.minimumFontSize = 12
    element.adjustsFontSizeToFitWidth = true
    return element
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    setConstraints()
  }
  
  private func setViews() {
    view.addSubview(backgroundImage)
    view.addSubview(mainVertStack)
    mainVertStack.addArrangedSubview(horisontalTopStack)
    mainVertStack.addArrangedSubview(weatherImage)
    mainVertStack.addArrangedSubview(horisontalMidleStack)
    mainVertStack.addArrangedSubview(cityLabel)
    mainVertStack.addArrangedSubview(emptyView)
    
    horisontalTopStack.addArrangedSubview(placeButton)
    horisontalTopStack.addArrangedSubview(surchTextField)
    horisontalTopStack.addArrangedSubview(surchButton)
    
    horisontalMidleStack.addArrangedSubview(numberLabel)
    horisontalMidleStack.addArrangedSubview(celceLabel)
    horisontalMidleStack.addArrangedSubview(cLabel)
  }
  
  private func setConstraints() {
    weatherImage.snp.makeConstraints { make in
      make.height.width.equalTo(120)
    }
    
    placeButton.snp.makeConstraints { make in
      make.height.width.equalTo(40)
    }
    
    surchButton.snp.makeConstraints { make in
      make.height.width.equalTo(40)
    }
    
    horisontalTopStack.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
    }
    
    mainVertStack.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.top.bottom.equalTo(view.safeAreaLayoutGuide)
    }
    
    backgroundImage.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}

//  MARK: - Show Canvas
struct ContentViewController: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = ViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    return ViewController()
  }
  
  func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}

struct ContentViewController_Previews: PreviewProvider {
  static var previews: some View {
    ContentViewController()
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.light) // or .dark
  }
}
