запит: Створи README.md. Вміст: ПІП: Sapeliuk Iryna Andriivna, група: KI-405,
варіант 4 (Rust, Cargo, cargo test), короткий опис проєкту (кросплатформний
Hello World на Rust, створюваний AI-агентом разом з тестом
BasicAddition та GitHub Actions для Windows, Linux, macOS) і розділ «Запуск
агента» з посиланням на docs/usage.md. Мова: українська.

відповідь AI: Створив README.md українською з даними про студентку, групу, варіант, описом проєкту та розділом «Запуск агента».
Посилання веде на docs/usage.md, але цього файлу наразі немає в репозиторії.

запит: Створи docs/architecture.md українською. Розділи: 1) які проблеми вирішує
агент; 2) skills (project-scaffold, build-and-test,
github-actions) і що кожен робить; 3) commands (git-init, create-project,
create-build, create-actions, check, init) з коротким описом; 4) які дані
передаються між етапами (Cargo.toml -> src/lib.rs -> tests/ -> ci.sh/ci.bat
-> ci.yml); 5) як оркестратор init обробляє помилки;

відповідь AI: Створив docs/architecture.md українською з усіма п’ятьма запитаними розділами: проблеми агента, skills, команди, передавання даних між етапами та обробка помилок в init.
У репозиторії поки немає реалізації агента, тому поведінку init описано як архітектурний сценарій.

запит: Створи файл .github/agents/build-engineer.agent.md: manifest AI-агента з YAML frontmatter. Розділи: роль (інженер збірки та CI для Rust Hello World), область відповідальності, правила роботи з файлами, заборонені дії, критерії успішного завершення.

відповідь AI: Створив build-engineer.agent.md з YAML frontmatter і запитаними розділами: роль, область відповідальності, правила роботи з файлами, заборонені дії та критерії успішного завершення.
Файл перевірено; збірка й тести не запускалися, оскільки це зміна документації.

запит: Створи файл .github/skills/project-scaffold/SKILL.md. Це skill для AI-агента
build-engineer. Файл починається з YAML frontmatter. Розділи:
1. створення базового Hello World проєкту на Rust, файлу README, структури каталогів та початкового .gitignore.
2. Коли застосовувати: під час первинної ініціалізації проєкту або для перевірки наявності його структури.
3. Вхідні дані: мова rust і назва проєкту hello.
4. Дії: якщо Cargo.toml відсутній, виконати cargo init --name hello; переконатися, що src/main.rs друкує Hello, World!; створити або доповнити .gitignore рядками /build, /target, *.log, .env без дублікатів; створити каталоги docs/ і tests/, якщо їх немає. Якщо Cargo.toml уже існує, cargo init повторно не запускати.
5. Вихідні файли: Cargo.toml, src/main.rs, .gitignore, каталоги docs/ і tests/.
6. Перевірки: існує src/main.rs; cargo run виводить Hello, World!
7. Типовий сценарій помилки: якщо `cargo` не встановлено, зупинити роботу.
8. Приклад: вхід language=rust, project_name=hello; очікуваний результат: проєкт hello, cargo run друкує Hello, World!

відповідь AI: Створив .github/skills/project-scaffold/SKILL.md з YAML frontmatter і всіма запитаними розділами: призначення, умови застосування, вхідні дані, дії, результати, перевірки, обробка помилки відсутнього Cargo та приклад.

запит: Створи файл .github/skills/build-and-test/SKILL.md для AI-агента build-engineer.
Frontmatter: name: build-and-test, description. Розділи:
1. Призначення: створення системи складання Cargo, тестованої функції таюніт-тесту, а також скриптів ci.sh і ci.bat.
2. Коли застосовувати: після project-scaffold.
3. Вхідні дані: наявні Cargo.toml та src/main.rs.
4. Дії:
створити .cargo/config.toml з [build] target-dir = "build", щоб результати складання потрапляли в build/;
створити src/lib.rs з pub fn add(a: i32, b: i32) -> i32;
оновити src/main.rs: друкує Hello, World! і викликає hello::add;
створити tests/basic_addition.rs з тестом BasicAddition, що перевіряє add(2, 3) == 5;
створити ci.sh і ci.bat, що виконують
cargo build --release, cargo test і перевіряють наявність виконуваного
файлу hello у build/release/.
Якщо файли вже існують, не дублювати вміст і не перезаписувати без потреби.
5. Вихідні файли: .cargo/config.toml, src/lib.rs, tests/basic_addition.rs,ci.sh, ci.bat.
6. Перевірки: cargo build --release успішний; cargo test проходить і показує BasicAddition; існує build/release/hello; каталог build/ не під Git.
7. Типовий сценарій помилки: тест падає. Реакція: показати вивід cargo test, не оголошувати успіх, зупинитися.
8. Приклад: вхід проєкт після project-scaffold; очікуваний результат: тест BasicAddition passed, створено build/release/hello.

відповідь AI: Створив SKILL.md із запитаними розділами та YAML frontmatter. Додав також вимогу ігнорувати /build у Git, необхідну для відповідної перевірки. Збірку й тести не запускав: створено лише документацію.

запит: Створи файл .github/skills/github-actions/SKILL.md для AI-агента build-engineer.
Frontmatter: name: github-actions, description. Розділи:
1. Призначення: створення .github/workflows/ci.yml для Windows, Linux і macOS.
2. Коли застосовувати: після build-and-test, коли існують ci.sh та ci.bat.
3. Вхідні дані: наявні ci.sh і ci.bat.
4. Дії: створити .github/workflows/ci.yml із тригерами push та pull_request до гілок develop і main. Налаштувати матрицю OS (ubuntu-latest, windows-latest, macos-latest). Додати кроки: checkout, запуск ci.sh для Linux/macOS, запуск ci.bat для Windows, збереження артефакту збірки. Логіка збірки має викликатися лише через скрипти, без прямих команд cargo. Файл не повинен містити секретів чи токенів.
5. Вихідні файли: .github/workflows/ci.yml.
6. Перевірки: YAML валідний; є всі три ОС; workflow викликає ci.sh та ci.bat; немає секретів.
7. Типовий сценарій помилки: якщо ci.sh або ci.bat відсутні — зупинити роботу та запропонувати спочатку виконати build-and-test.
8. Приклад: вхід ci.sh і ci.bat; очікуваний результат: ci.yml з матрицею із трьох ОС.

відповідь AI: Створив .github/skills/github-actions/SKILL.md з YAML frontmatter і всіма запитаними розділами. Уточнив платформні способи запуску ci.sh/ci.bat, збереження артефакту та заборону прямих команд Cargo у workflow.і
