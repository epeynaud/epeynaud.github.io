#!/bin/bash
# ========================================
# Génération des sites
# ========================================

# Arrête le script si une commande échoue
set -e

echo "=== Quarto rendering steps ==="
# Génère le site en français puis en anglais
cd fr/
quarto render
cd ../en/
quarto render
cd ..

# Supprime l'ancien répertoire de déploiement
echo "=== Nettoyage ==="
if [ -d website ]; then
    echo "website existe déjà, suppression..."
    rm -rf website
fi

echo "=== Creating the public repertory for the webpages ==="
mkdir website
cp -r fr/_site-fr/ website/fr
cp -r en/_site-en/ website/en
cp index.html website/
cp style.css website/
echo "Done. Run serve-local.sh to preview the webpages."
