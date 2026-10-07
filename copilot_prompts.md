Створи звичайну програму яка виводить текст Hello World на Rust.
Створи файл README з моїм ПІП - Sapeliuk Iryna Andriivna, групою - КІ-405, номером варіанту 22.
Зміни Cargo.toml файл для бінарного пакета з назвою hello, edition 2021, версія 0.1.0.
Додай у Cargo.toml секцію [lib] з назвою math_operations і шляхом src/lib.rs, а також [[bin]] з назвою hello і шляхом src/main.rs.
Додай у src/lib.rs функцію pub fn add(a: i32, b: i32) -> i32.
Створи файл tests/unit_tests.rs, підключи в ньому бібліотеку math_operations та реалізуй набір тестів: базовий BasicAddition для додавання та тести для від'ємних чисел і нуля.
main.rs повинен використовувати функцію add з бібліотеки math_operations.
Згенеруй batch-скрипт ci.bat, який без параметрів виконує cargo build --release, потім cargo test, зупиняється на першій помилці, у разі успішного проходження обох кроків виводить повідомлення, що виконуваний файл target\release\hello.exe успішно створено.
Напиши конфігурацію у файлі ci.yml, яка спрацьовує на push і pull_request для гілок master і develop. Налаштуй job cross_build із кросплатформною матрицею для ubuntu-latest, windows-latest та macos-latest. Додай кроки для чекауту коду, встановлення стабільного Rust через dtolnay/rust-toolchain@stable, а також кроки збірки й тестування (використовуй cargo build --release та cargo test напряму, щоб уникнути проблем із сумісністю скриптів на різних ОС). Налаштуй upload-artifact для збереження бінарника з урахуванням розширення .exe на Windows.