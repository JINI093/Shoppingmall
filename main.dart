import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> items = []; 

  void addItem(Product product) {
    items.add(product);
    print('${product.name}을(를) 장바구니에 추가했습니다.');  
  }

  int getTotalPrice() {
    return items.fold(0, (total, current) => total + current.price);
  }

  void printAll() {
    for (var item in items) {  
      print('${item.name} / ${item.price}원');
    }
  }
}

void main() {
  List<Product> productList = [  
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];

  ShoppingMall cart = ShoppingMall();

  while (true) {
    print('-' * 80);
    print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print('-' * 80);

    stdout.write('메뉴를 선택하세요: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        for (int i = 0; i < productList.length; i++) {
          print('${i + 1}. ${productList[i].name} - ${productList[i].price}원');
        }
        break;

      case '2':
        stdout.write('상품 번호를 입력해 주세요: '); 
        String? productChoice = stdin.readLineSync();
        int? index = int.tryParse(productChoice ?? '');

        if (index != null && index > 0 && index <= productList.length) {
          cart.addItem(productList[index - 1]);
        } else {
          print('잘못된 상품 번호입니다.');
        }
        break;

      case '3':
        print('장바구니에 ${cart.getTotalPrice()}원 어치를 담으셨네요.');
        break;

      case '4':
        print('이용해 주셔서 감사합니다! 안녕히 가세요!');
        return;

      default:
        print('지원하지 않는 기능입니다! 다시 시도해주세요.');
    }
  }
}