<img width="1539" alt="스크린샷 2021-10-13 오후 3 30 00" src="https://user-images.githubusercontent.com/62981652/137079198-e492b085-af74-4590-b018-d86b6cb2c5ba.png">

<br>

## 📌 1주차 과제 READEME

1주차 과제는 로그인, 회원가입, 확인화면 UI구성과 화면전환 그리고 데이터 전달입니다..!
<br>
<br>

### ▶️ UI 구성하기
- [x] 로그인 화면 UI 구성하기
- [x] 회원가입 화면 UI 구성하기
- [x] 확인 화면 UI 구성하기!
<br>

![Simulator Screen Recording - iPhone 11 - 2021-10-13 at 12 45 00 mp4](https://user-images.githubusercontent.com/62981652/137064033-017366b4-43dd-4252-b67b-cc3235fc1602.gif)

1주차 과제 최종 구현 화면 입니다~~! 
<br><br>

### ▶️ 화면 전환하기
- [x] 로그인 화면 → 회원가입 화면 으로 push로 화면전환하기
```swift
    @IBAction func touchUpToGoJoinView(_ sender: Any) {
        guard let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinVC")
            else {return}
        //네비게이션 방식
        self.navigationController?.pushViewController(joinVC, animated: true)
    }
```
<br>

- [x] 로그인 화면 → 확인 화면 으로 present로 화면전환하기
```swift
    @IBAction func touchUpToGoWelcomeView(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
        
        //데이터 전달
        welcomeVC.name = nameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
    }
```
<br>

- [x] 회원가입 화면 → 확인 화면 으로 present로 화면전환하기 
```swift
    @IBAction func touchUpToGoWelcomeView(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC")as? WelcomeVC else {return}

        //데이터 전달
        welcomeVC.name = nameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
    }
```
<br><br>

### ▶️ 기능 구현하기
- [x] 로그인 화면에서 적은 이름을 확인 화면에서 띄우기
- [x] 회원가입 화면에서 적은 이름을 확인 화면에서 띄우기
> 1. present방식으로 입력받은 이름을 넘겨준다.
> 2. 확인화면의 Label에 넘겨받은 이름을 띄워준다.

```swift
    func setNameInLabel(){
        if let userName = name {
            nameLabel.text = userName + " 님"
            nameLabel.sizeToFit()
        }
    }
```
<br><br>

### 🔥 도전과제
- [x] 로그인화면과 회원가입 화면에서 3개의 textfield값이 모두 채워지면 다음 버튼이 활성화되는 로직 구현하기
> 1. 먼저 `viewDidLoad`가 되면 다음 버튼이 비활성화 되도록 해준다.
> 2. `setTextField()`를 보면 for: 뒤에 .editingChanged로 에디팅이 될 때마다 해당 함수가 호출된다.
> 3. `textFieldDidChange`를 통해서 텍스트필드에 텍스트가 있는지 이벤트를 감지한다. - 조건을 충족하면 다음 버튼 활성화 
```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
        setTextField()
    }

    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        if (nameTextField.hasText) && (emailTextField.hasText) && (passwordTextField.hasText){
                nextBtn.isEnabled = true
            } else {
                nextBtn.isEnabled = false
            }
    }

    func setTextField() {
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
    }
```
<br>

- [x] 회원가입 화면에서 비밀번호 표시를 누를 경우 비밀번호가 표시되도록 구현하기
> 1. `.isSecureTextEntry`는 https://developer.apple.com/documentation/uikit/uitextinputtraits/1624427-issecuretextentry 이곳에 자세한 설명이 있다.
> 2. 비밀번호입력 텍스트필드는 Inspector Area에서 Secure Text Entry로 설정을 했기에, 비밀번호 표시 버튼을 클릭하면 해당 if문을 돌게된다.
> 3. `.setImage(_:for:)`를 통해서 클릭했을 때와 아닐 때의 이미지를 설정해준다.
```swift
    @IBAction func didTapViewPassword(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            showPasswordBtn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            showPasswordBtn.setImage(UIImage(systemName: "square"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
```
<br><br>


### 🌱 금잔디 코드 리뷰 - 수정사항
Q) 변수명이나 함수명을 작성할 때 너무 길게 작성하는거 같아서 좋은 방법이 있을지 궁금합니다.

A) 개인적으로 협업시 변수명이나 함수명이 길더라도, 다른 사람이 봤을 때 정확하게 변수명과 함수명이 전달된다면 좋은 네이밍 방법이라고 생각합니다! Button은 Btn이라는 약자로, ViewController는 VC라는 약자로, TableView는 TV로, CollectionView는 CV로, TableViewCell은 TVC로, CollectionViewCell은 CVC로 많이 줄여서 쓰곤 합니다!
<br><br>

1. nameTextField.hasText를 사용하면 textField에 텍스트가 있는지를 bool값을 사용하지 않아도 알 수 있습니다.
```swift
//이전의 코드
@objc func textFieldDidChange(_ sender:Any?) -> Void {
    if (nameTextField.text?.isEmpty == false) && (emailTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false){
	      nextButton.isEnabled = true
	  } else {
	      nextButton.isEnabled = false
	  }
}

//변경한 코드 : 코드가 더 간결해 졌다.
@objc func textFieldDidChange(_ sender:Any?) -> Void {
    if (nameTextField.hasText) && (emailTextField.hasText) && (passwordTextField.hasText){
        nextButton.isEnabled = true
    } else {
        nextButton.isEnabled = false
    }
}
```
<br>

2. 변수 네이밍 시 nextVC 1 2 3 이런 방식보다, destination의 VC가 어떤 VC인지 명시해주면 변수명에서부터 어떤 VC를 불러오는지 알 수 있어서 더 좋을 것 같아요! 
그리고 identifier는 나중에 헷갈리는 경우가 종종 있어서 클래스명과 일치시키는 것을 추천드립니다!!
``` swift
//이전의 코드
guard let nextVC1 = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeVC else {return}

//이후의 코드
guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
```
<br>

3. viewDidLoad안에는 코드가 있는것 보다, 함수를 적어주는게 훨씬 보기깔끔해요!! 위 세줄 textfield와 관련된 함수들은 setTextField() 라는 함수로 따로 빼주고, viewDidLoad안에는 setTextField()를 호출만 해주면 더 깔끔할 것 같아요~! 
```swift
//이전의 코드
override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
    }
    
//이후의 코드
override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
        setTextField()
    }

func setTextField() {
    self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
    self.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
    self.passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
}
```
<br><br>

### ❓ @objc가 뭐야??
[@objc]가 붙은 이유는 Objective-c 에서 쓰이는 클래스나 함수의 선언을 해줄 때 붙여줍니다!Swift를 사용한 코드를 Objective-C 코드와 상호작용 시키기 위해 쓰는 키워드라고 합니다! Swift를 사용한 코드에서 class나 method에 이 키워드를 붙이면 Objective-C와 Swift 코드에서 사용할 수 있게 됩니다

저희가 도전과제를 하기 위해 textField에 addTarget으로 함수를 지정해주었죠!addTarget은 control로 발생하는 이벤트가 있을 때 target 오브젝트와 action 메서드를 이어주는 함수 입니다~!addTarget을 해주면서 control로 발생하는 이벤트가 있을 때 실행될 함수를 selector로 지정해주었는데요.
```
#selector란
함수를 직접 지정해서 실행할 때 사용되는 함수 선택 지정자입니다.
본래 Objective-C에서 @selector(methodName)라는 형식으로 사용 되었는데, 런타임에서 선택한 함수가 실행되는 동적 바인딩의 형태 입니다.
이게 Swift로 넘어오면서 #selector() 키워드로 바뀌며 안에 함수를 지정하는 형태가 되었습니다.
#selector() 에 전달할 메소드를 작성할 때는 Objective-C와의 호환성을 위해 반드시 함수에 @objc 키워드를 붙여줘야 합니다.
```
> https://hyunndyblog.tistory.com/161 에 잘 정리되어 있으니 링크 참고!

<br><br>


### ❓ delegate가 뭐야???
델리게이트 패턴은 쉽게 말해서, 객체 지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아니라 처리 해야 할 일 중 일부를 다른 객체에 넘기는 것을 뜻 합니다. 

delegate는 일종의 프로토콜인데, 함수 선언 하는 것 처럼 프로토콜도 채택해줘야 합니다. 프로토콜을 '선언'한다는 말은 틀린 용어고, **프로토콜을 '채택'한다**가 맞는 용어입니다.
제드님의 실습자료에서 delegate를 사용하는 이유는 클릭액션이 아닌 엔터를 했을 때 값을 바꾸고싶거나 그럴 때 사용 되는거? 같습니다..
https://zeddios.tistory.com/8 에 잘 정리되어 있으니 링크 참고!


