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

відповідь AI: Створив .github/skills/github-actions/SKILL.md з YAML frontmatter і всіма запитаними розділами. Уточнив платформні способи запуску ci.sh/ci.bat, збереження артефакту та заборону прямих команд Cargo у workflow.

запит: Створи файл .github/prompts/git-init.prompt.md: prompt-команду для AI-агента з YAML frontmatter. Розділи :
1. Призначення: перевірити Git-репозиторій, створити або оновити .gitignore, показати стан Git.
2. Передумови: поточний каталог є Git-репозиторієм. Якщо ні, вивести «Not a git repository» і зупинитися, нічого не створюючи.
3. Дії: виконати git status та git branch --show-current; створити або доповнити .gitignore рядками /build, /target, *.log, .env без дублікатів; показати фінальний git status.
4. Очікувані файли: .gitignore.
5. Команди перевірки: git check-ignore build target має показати обидва шляхи.
6. Повідомлення про помилку: не Git-репозиторій або неможливо записати  .gitignore. Нічого не видаляти. повторний запуск не дублює рядки в .gitignore.

відповідь AI: Створив git-init.prompt.md із YAML frontmatter та інструкціями перевірки репозиторію, безпечного оновлення .gitignore, перевірки виключень Git і відображення фінального стану. Повторний запуск не повинен дублювати правила.

запит: Створи файл .github/prompts/create-project.prompt.md: prompt-команду для агента з YAML frontmatter. Розділи:
1. Призначення: створити початковий Rust Hello World через skill project-scaffold.
2. Передумови: встановлено cargo, виконано git-init.
3. Дії: застосувати skill project-scaffold з параметрами language=rust, project_name=hello.
4. Очікувані файли: Cargo.toml, src/main.rs, .gitignore, каталоги docs/ і tests/.
5. Команди перевірки: cargo run виводить Hello, World!
6. Повідомлення про помилку: якщо cargo відсутній, повідомити про необхідність
встановити Rust через rustup і зупинитися.
7.  Якщо Cargo.toml уже існує, не запускати cargo init повторно і не перезаписувати src/main.rs без потреби.

відповідь AI: Створив create-project.prompt.md з YAML frontmatter та запитаними інструкціями для project-scaffold, включно з передумовами, очікуваними файлами, cargo run і захистом від повторної ініціалізації чи зайвого перезапису.

запит: Створи файл .github/prompts/create-build.prompt.md: prompt-команду для агента YAML frontmatter. Розділи:
1. Призначення: створити конфігурацію складання та юніт-тест через skill
build-and-test.
2. Передумови: існують Cargo.toml та src/main.rs (інакше запропонувати спочатку виконати create-project).
3. Дії: застосувати skill build-and-test.
4. Очікувані файли: .cargo/config.toml, src/lib.rs, tests/basic_addition.rs, ci.sh, ci.bat.
5. Команди перевірки: cargo build --release, потім cargo test; перевірити, що існує build/release/hello і що тест BasicAddition виконано.
6. Повідомлення про помилку: якщо складання чи тест не проходять, показати вивід команди, не оголошувати успіх і зупинитися.
7.Повторний запуск не дублює код у src/lib.rs, main.rs і скриптах.

відповідь AI: Створив create-build.prompt.md з YAML frontmatter і запитаними розділами. Додав перевірку передумов, послідовний запуск збірки й тестів, перевірку виконуваного файла та правила, щоб повторний запуск не дублював код.

запит: Створи файл .github/prompts/create-actions.prompt.md: prompt-команду для агента з YAML frontmatter. Розділи:
1. Призначення: створити CI workflow через skill github-actions.
2. Передумови: існують ci.sh та ci.bat (інакше запропонувати виконати create-build).
3. Дії: застосувати skill github-actions.
4. Очікувані файли: .github/workflows/ci.yml.
5. Команди перевірки: перевірити валідність YAML; ci.yml містить ubuntu-latest,windows-latest, macos-latest; workflow лише запускає ci.sh та ci.bat; у файлі немає секретів.
6. Повідомлення про помилку: відсутні скрипти або в matrix немає однієї з трьох
ОС. Показати, чого саме бракує, і зупинитися.
7. Повторний запуск оновлює ci.yml, а не створює дубль чи другий workflow.

відповідь AI: Створив create-actions.prompt.md. Він містить YAML frontmatter, перевірку наявності ci.sh і ci.bat, інструкції застосування skill github-actions, критерії перевірки workflow та обробку помилок. Повторний запуск оновлює наявний ci.yml і не створює додаткових workflow-файлів.

запит: Створи файл .github/prompts/check.prompt.md: prompt-команду для агента з YAML frontmatter. Розділи:
1. Призначення: перевірити проєкт, нічого не змінюючи. Команда не створює, не редагує і не видаляє жодних файлів.
2. Передумови: немає.
3. Дії: виконати перевірки та вивести таблицю PASS/FAIL для кожної:
існує manifest агента build-engineer.agent.md з роллю, обмеженнями та критеріями завершення;
існують три skills, у кожному є призначення, вхід, вихід, перевірки;
існують шість prompt-файлів: git-init, create-project, create-build, create-actions,  check, init;
існують Cargo.toml, src/, tests/, ci.sh, ci.bat, ci.yml;
cargo build --release проходить;
cargo test проходить, тест BasicAddition виконано;
існує виконуваний файл build/release/hello (hello.exe на Windows);
ci.yml валідний, містить ubuntu-latest, windows-latest, macos-latest і запускає ci.sh та ci.bat;
git ls-files не містить build/, target/, .env.
4. Очікувані файли: жодних нових (лише вивід у чат).
5. Повідомлення про помилку: для кожного FAIL вказати, що саме не пройшло і що з цим робити. У кінці вивести загальний підсумок PASS або FAIL.
6. Заборонено виправляти знайдені проблеми самостійно: лише повідомляти.

відповідь AI: Створив check.prompt.md. Prompt перевіряє всі перелічені файли, конфігурації, збірку, тести та Git і вимагає таблицю PASS/FAIL із загальним підсумком. Виправляти проблеми заборонено; дозволено лише створення або оновлення згенерованих Cargo-артефактів у build/.

запит: Створи файл .github/prompts/init.prompt.md: prompt-команду для агента з YAML frontmatter. Це оркестратор повного сценарію. Розділи:
1. Призначення: послідовно виконати повний сценарій створення проєкту.
2. Передумови: відкритий Git-репозиторій, встановлено cargo, існують manifest
агента, три skills і команди git-init, create-project, create-build, create-actions, check.
3. Дії: виконати по черзі в цьому порядку:
1) git-init
2) create-project
3) create-build
4) create-actions
5) check
Після кожного кроку вивести його статус. Результат попереднього кроку використовується наступним.
4. Обробка помилок: зупиняється на першій помилці, показує її вивід, наступні
кроки не виконує. Не приховує помилки й не вважає роботу успішною без результату PASS від check.
5. Очікувані файли: усі файли, створені командами 1-4.
6. Фінальний звіт: що створено, що пропущено, результат check.
7. Повторний запуск init не руйнує проєкт, не дублює конфігурацію і не перезаписує наявні файли без потреби.
8. Заборонено: видалення файлів, git push --force, робота із секретами.

відповідь AI: Створив init.prompt.md з YAML frontmatter та послідовністю git-init → create-project → create-build → create-actions → check. Додав перевірку передумов, статус кожного етапу, зупинення на першій помилці, фінальний звіт і правила безпечного повторного запуску. Успіх оркестрації можливий лише за результату PASS від check.

