# cv05

## Úloha 6.1: Príprava Kubeflow
Priprav si Kubeflow podľa návodu *04 Odovzdávanie, časť 1*: v Exploreri je hore **WEB**, dole na stavovej lište je **Go Live**. Ak tam nie je, rozšírenia vráti tento príkaz v termináli:

```bash
code-server --install-extension Natizyskunk.sftp --install-extension yandeu.five-server --install-extension bmewburn.vscode-intelephense-client --install-extension mblode.twig-language-2

```

Potom stlač `F1`, zvoľ `Developer: Reload Window`. Nastavenie pripojenia na `sigma` zostáva.

---

## Úloha 6.2: Zadanie a kópia minulého týždňa

Prijmi zadanie `cv05` v Classroom 50 (link je vyššie) a repository naklonuj do `~/web/ti/cv05` podľa návodu *04, časti 2 a 3*. Potom do neho prekopíruj svoj web z minulého týždňa:

```bash
cd ~/web/ti
rsync -a --exclude .git --exclude .github --exclude README.md cv04/ cv05/

```

Pravý klik na `cv05` $\rightarrow$ **Upload Folder**. Over na sigma `…/ti/cv05/web/`, že web beží.

---

## Úloha 6.3: Form na POST

1. V `web/content/register.php` over, že všetky polia majú anglické `name` a `value` bez diakritiky (skupina checkboxov má `[]`).
2. Doplň `method="post"` a `action="../practice/process.php"`.
3. Odošli form: adresa po odoslaní nemá `?` a stránka hlási, že `process.php` neexistuje. To je v poriadku.

---

## Úloha 6.4: process.php

1. Použi prompt z *Ukážky 6* so svojím formulárom.
2. Výsledok ulož ako `practice/process.php`.
3. Vyplň form na serveri `sigma`, odošli a prezri si výstup funkcie `print_r`.
4. Odošli ho aj s nezaškrtnutým checkboxom a pozri sa, ktorý kľúč v poli chýba.

---

## Úloha 6.5: Kontroly rukou

Doplň `// DOPLŇ:` kontrolu pre všetky zvyšné polia:

* dátum cez `strtotime` (a over, že nie je v budúcnosti, ak to pre danú tému dáva zmysel),
* `select` a `radio` cez `in_array` s `array_keys`,
* súhlas (checkbox),
* dĺžka správy.

Každú kontrolu vyskúšaj: odošli neplatnú hodnotu a over chybovú hlášku.

---

## Úloha 6.6: Prehliadač nestačí

Cez `F12` (Vývojárske nástroje) v prvku `<input>` pre meno zmaž atribút `required` a odošli formulár prázdny. Skript `process.php` musí chybu zachytiť. Ak ju nezachytí, chýba validácia na strane servera.

---

## Úloha 6.7: XSS

1. Do poľa pre meno zadaj `<script>alert('ahoj')</script>` a odošli formulár.
2. Ak vyskočí vyskakovacie okno, nájdi v `process.php` výpis bez funkcie `htmlspecialchars` a oprav ho.
3. Prejdi všetky výpisy hodnôt od používateľa (vrátane `$value` v cykloch).
4. Do súboru `README.md` v repozitári dopíš dve vety: čo sa stalo pred opravou a čo po nej.

---

## Úloha 6.8: Výpočty

1. Použi prompt z *Ukážky 7*.
2. Doplň `// DOPLŇ:` vlastný výpočet súvisiaci s tvojou témou (napr. počet dní od udalosti, roky do udalosti, počet znakov, percento…).

---

## Úloha 6.9: Samospracujúci form

1. Použi prompt z *Ukážky 8*.
2. Výsledok ulož ako `web/content/register.php`.
3. Doplň `// DOPLŇ:` skopíruj kontroly z `process.php` a doplň chýbajúce polia.
4. Na serveri `sigma`:
* Otvor *Registráciu* z menu (zobrazí sa prázdny formulár),
* Odošli formulár s chybou (zadané hodnoty zostanú zachované, chybné polia sa zvýraznia načerveno),
* Odošli správne vyplnený formulár (zobrazí sa zhrnutie).


5. Súbor `process.php` v repozitári ponechaj (slúži ako cvičný súbor podobne ako `variables.php`).

---

## Úloha 6.10: Chyba naschvál

1. V `web/content/register.php` prepíš v jednom `$_POST['email']` kľúč na `$_POST['emial']`.
2. Odošli formulár a zisti, čo sa stalo (zobrazila sa chyba, alebo nastala tichá chyba vďaka operátoru `??`). Následne kód oprav.
3. Potom zmaž `method="post"`, odošli a skontroluj URL adresu. Následne kód vráť späť.

---

## Úloha 6.11: Commit a push

* Postupuj podľa návodu *04 Odovzdávanie, časť 5*.
* Vykonaj `commit` po každej dokončenej úlohe.
* Skontroluj výsledok testov podľa *časti 6*.

---

## Úloha 6.12: Upload Folder a kontrola na sigma

Klikni pravým tlačidlom myši na priečinok `cv05` $\rightarrow$ **Upload Folder**. Skontroluj funkčnosť na serveri `sigma`:

* `web/index.php`
* `web/routes.php`
* `web/form.php` (prázdny, s chybou, správne odoslaný)
* `web/contact.php`
* `practice/process.php` (pri priamom otvorení v prehliadači musí byť prázdny)

---

### Hodnotenie: 1 bod

* V repozitári `cv05` na GitHube aj na serveri `sigma` je formulár spracovaný cez `POST`.
* Súbor `process.php` obsahuje kontroly a výpočty.
* Súbor `content/register.php` funguje ako samospracujúci formulár s ošetrenými výstupmi (`htmlspecialchars`).
* **Termín:** `commit` a `push` vykonať najneskôr do nasledujúceho cvičenia.

> **Uzávierka 2:** Koniec tohto týždňa – formulár musí spracúvať PHP s validáciou vstupov a ošetrením výstupov a bežať na serveri `sigma`.
> **Kolo 1 obhajob:** Obhajuje sa statika a PHP z kópie `obhajoba1/cv05` (príkaz je uvedený nižšie).