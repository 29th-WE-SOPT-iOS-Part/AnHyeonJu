<img width="1286" alt="스크린샷 2021-10-27 오전 10 52 40" src="https://user-images.githubusercontent.com/62981652/138986492-0a4e346a-9aa3-46da-890d-733211d19589.png">

<br>

## 📌 Feature Issue

2주차 과제는 1주차 과제에서 만든 뷰에 AutoLayout을 적용시키는 것과 
Tabbar를 만든 후 확인화면에서 텝바 화면으로 이동하는 것입니다! 
<br><br>

## 📝 To-do
### ▶️ UI 구성하기
- [x]  로그인 화면 AutoLayout 적용하기
- [x]  회원가입 화면 AutoLayout 적용하기
- [x]  확인 화면 AutoLayout 적용하기
- [x]  확인 화면에 "다른 계정으로 로그인하기" 버튼 추가하기 
<br>

![Simulator Screen Recording - iPhone 11 - 2021-10-27 at 12 01 48 mp4](https://user-images.githubusercontent.com/62981652/138992817-ce447798-9f80-4708-a261-02fff55ca130.gif)

2주차 과제 최종 구현 화면입니다. 
<br><br>

### ▶️ 화면 전환하기
- [x]  확인 화면에 "다른 계정으로 로그인하기 버튼 추가" 누르면 처음 로그인 화면으로 돌아가기
    - 로그인 → 확인 화면으로 온 경우, 로그인 → 회원가입 → 확인 화면으로 온 경우 모두 동일하게
    버튼을 누르면 처음 로그인 화면으로 돌아가도록 구현하기

1. 처음에는 WelcomeVC에서 LoginVC로 present하는 방식으로 구현
```swift
  @IBAction func touchUpToGoAnotherLoginView(_ sender: Any) {
        guard let anotherLoginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")as? LoginVC else {return}
        
        anotherLoginVC.modalPresentationStyle = .fullScreen
        self.present(anotherLoginVC, animated: true, completion: nil)
    }
```
> 다른 계정을 로그인 하기 버튼을 누를 경우, 로그인화면으로 돌아간다. 하지만 이후 회원가입하기나 다른 동작들이 불가능하다. 스택이 쌓이지 않는다. <br>
> -> 네비게이션 컨트롤러로 돌아가야 로그인창부터 회원가입 창까지 스택이 쌓인다.
<br>

2. 해결책으로 LoginVC 아니라 StoryBoard에 서 맨 앞에 보이는 Navigation Controller로 이동하도록 연결 --> 문제 발생
```swift
  @IBAction func touchUpToGoAnotherLoginView(_ sender: Any) {
      guard let anotherLoginVC = self.storyboard?.instantiateViewController(withIdentifier: "UINavigationVC")as? UINavigationVC else {return}

      anotherLoginVC.modalPresentationStyle = .fullScreen
      self.present(anotherLoginVC, animated: true, completion: nil)
  }
```
> 먼저 Navigation Controller에 해당하는 뷰의 VC르 만들어준다. 그 후에 LoginVC자리를 UINavigationVC로 바꿔주면 끝! <br>
> (문제발생) 스택이 계속 쌓이다보면 나중에 느려지는 문제가 발생할 수 있다. 그래서 뷰들을 pop해주는 방법으로 돌아가보자!
<br>

3. popToRootViewController를 사용해서 Navigation stack을 제거하자.
```swift
  @IBAction func touchUpToGoAnotherLoginView(_ sender: Any) {
      guard let anotherLoginVC = self.presentingViewController as? UINavigationController else { return }
      dismiss(animated: true) { anotherLoginVC.popToRootViewController(animated: true) }
```
> 원래는 위와같이 WelcomeVC에 popToRootViewController를 사용해서 RootView(LoginVC)로 이동하도록 구현했었다.<br>
> 하지만 LoginVC -> SignUpVC -> WelcomeVC로 이동했을 경우 되돌아가는 모습이 다 보였다. <br>
> 같은 금잔디조에 도움을... 요청한 결과 지은님께서 해결책을 주셨다. 
<br>

4. 클로저 함수의 파라미터중 completion이라는 프로퍼티를 사용해서 stack을 pop하자
```swift
//SignUpVC
@IBAction func touchUpToGoWelcomeView(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC")as? WelcomeVC else {return}
        
        welcomeVC.name = nameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        
        //샤라웃 투 지은님... 감사합니다...
        self.present(welcomeVC, animated: true, completion: {
            //confirmVC로 modal present와 동시에 navigation stack에서 signUpVC를 pop해줘서 rootVC로 돌아가게끔 해줍니다. (popViewController, popToRootViewController 모두 가능)
            self.navigationController?.popToRootViewController(animated: true)
        })
    }
```
```swift
//WelcomeVC
    @IBAction func touchUpToGoAnotherLoginView(_ sender: Any) {        
        self.dismiss(animated: true, completion: nil)
    }
```
> (1) 화면전환(present)가 끝나고 어떤일을 처리해주고 싶다면 (그 다음 줄에다 코드를 사용할 수도 있지만 -> 이러면 함수의 호출 시점이 불분명해짐) 이 때 completion Handler를 사용하면된다.<br>
> (2) SignUpVC에서 popToRootViewController를 사용해서 뷰전환을 시켜줌으로써 SignUpVC의 Navigation stack을 제거 <br>
> (3) 완전히 뷰가 이동된 상황(함수의 종료 및 반환)에서 Navigation stack의 제거 상황과 popToRootViewController의 애니메이션이 안보이도록 함수의 동작 순서를 정해주고 싶을 때 completion Handelr를 사용한다.<br>
> (4) SignUpVC에서 present를 함과 동시에 Navigation stack을 제거해서 추후에 WelcomeVC에서 dismiss를 하게 되면 어떻게든 rootVC인 로그인창으로 가도록 구현!!

<br><br>

- [x]  확인 화면에서 확인 화면 누르면 Tabbar로 연결된 화면 Present 하기
```swift
    @IBAction func touchUpToGoTabBarView(_ sender: Any) {
        let tabbar = UIStoryboard.init(name: "Tabbar", bundle: nil)
        guard let tabBarController = tabbar.instantiateViewController(withIdentifier: "MainTBC")as? MainTBC else {return}
        
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
```
<br><br>

### ▶️ 기능 구현하기
- [x]  Tabbar에 5개의 view controller 연결하기
- [x]  tabbar title, image, selected image 바꾸기
```swift
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(identifier: "ShortsVC"),
              let plusVC = self.storyboard?.instantiateViewController(identifier: "PlusVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(identifier: "SubscribeVC"),
              let storeVC = self.storyboard?.instantiateViewController(identifier: "StoreVC")
            else { return }
        
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(named: "shortsIcon")
        shortsVC.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")
        
        plusVC.tabBarItem.title = "추가"
        plusVC.tabBarItem.image = UIImage(named: "plusCircleIcon")
        plusVC.tabBarItem.selectedImage = UIImage(named: "plusCircleIcon")
        
        subscribeVC.tabBarItem.title = "구독"
        subscribeVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        subscribeVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        
        storeVC.tabBarItem.title = "보관함"
        storeVC.tabBarItem.image = UIImage(named: "libraryIcon")
        storeVC.tabBarItem.selectedImage = UIImage(named: "libraryIconFill")
        
        setViewControllers([homeVC, shortsVC, plusVC, subscribeVC, storeVC], animated: true)
        
    }
```
<br><br><br>

### 🌱 잡다하지만 유용했던
1. 폴더링!
<img width="238" alt="스크린샷 2021-10-27 오전 11 53 42" src="https://user-images.githubusercontent.com/62981652/138991880-09f67564-8918-4f25-8a90-69c684ab1903.png">
<br>

2. StoryuBoard 나누기
 위의 그림을 보면 알겠지만 Tabbar라는 스토리보드를 만들어서 Tabbar관련 작업은 다 저기에서  작업을 했다..!
<br>

3. LoginVC에 있는 Custom Method들을 손봤다.
> 첫번째 함수는 if,else문으로 나뉘어있던 것을 한줄로 짧게 바꿨다. <br>
> 두번째 함수는 3줄에 걸쳐 반복되는 동작을 forEach를 사용해서 짧게 바꿨다.<br>
> 세번째 함수또한 반복되는 동작을 forEach를 사용해서 짧게바꿨다. 

```swift
    // MARK: - Custom Method
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        nextBtn.isEnabled = nameTextField.hasText && emailTextField.hasText && passwordTextField.hasText
    }
    
    func setTextFieldEmpty() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0.text = ""
        }
    }
    
    func setTextField() {
        [nameTextField, emailTextField, passwordTextField].forEach{
            $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
```


