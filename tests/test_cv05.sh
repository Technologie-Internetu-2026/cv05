#!/usr/bin/env bash
set -e

SCORE=0
TOTAL=6

echo "=== SPUSTENI AUTOGRADERU PRO CV05 ==="

# 1. Kontrola existence souborů
echo -n "[Test 1] Kontrola existence pozadovanych souboru... "
if [ -f "practice/process.php" ] && [ -f "web/content/register.php" ]; then
    echo "OK (+1)"
    SCORE=$((SCORE + 1))
else
    echo "CHYBA: Chybi practice/process.php nebo web/content/register.php"
fi

# 2. Kontrola metody POST a akce ve formuláři
echo -n "[Test 2] Kontrola pouziti metody POST... "
if grep -qi 'method=["\x27]post["\x27]' web/content/register.php; then
    echo "OK (+1)"
    SCORE=$((SCORE + 1))
else
    echo "CHYBA: V web/content/register.php nebyla nalezena method=\"post\""
fi

# 3. Kontrola pouziti $_POST v PHP scriptech
echo -n "[Test 3] Kontrola zpracovani superglobalni promenne \$_POST... "
if grep -q '\$_POST' practice/process.php && grep -q '\$_POST' web/content/register.php; then
    echo "OK (+1)"
    SCORE=$((SCORE + 1))
else
    echo "CHYBA: \$_POST chybi v process.php nebo register.php"
fi

# 4. Kontrola ochrany proti XSS (htmlspecialchars)
echo -n "[Test 4] Kontrola osetreni vystupu pres htmlspecialchars... "
if grep -q 'htmlspecialchars' practice/process.php && grep -q 'htmlspecialchars' web/content/register.php; then
    echo "OK (+1)"
    SCORE=$((SCORE + 1))
else
    echo "CHYBA: Funkce htmlspecialchars() nebyla nalezena v obou souborech"
fi

# 5. Kontrola serverovych validaci (in_array, strtotime nebo delka)
echo -n "[Test 5] Kontrola implementace serverovych validaci... "
VALIDATION_PASS=0
if grep -q 'in_array' practice/process.php || grep -q 'in_array' web/content/register.php; then
    VALIDATION_PASS=$((VALIDATION_PASS + 1))
fi
if grep -q 'strtotime' practice/process.php || grep -q 'strtotime' web/content/register.php; then
    VALIDATION_PASS=$((VALIDATION_PASS + 1))
fi

if [ $VALIDATION_PASS -ge 1 ]; then
    echo "OK (+1)"
    SCORE=$((SCORE + 1))
else
    echo "CHYBA: Nebyly nalezeny ocekavane validacni funkce (in_array, strtotime)"
fi

# 6. Kontrola zapisu do README.md k Uloze 6.7 (XSS)
echo -n "[Test 6] Kontrola zaznamu k XSS v README.md... "
if [ -f "README.md" ] && grep -qi 'xss' README.md; then
    echo "OK (+1)"
    SCORE=$((SCORE + 1))
else
    echo "CHYBA: V README.md chybi poznamka k XSS testu"
fi

echo "======================================"
echo "VYSLEDEK TESTU: $SCORE / $TOTAL"

if [ $SCORE -eq $TOTAL ]; then
    echo "Vsechny testy uspesne prosly!"
    exit 0
else
    echo "Nektere testy selhaly."
    exit 1
fi