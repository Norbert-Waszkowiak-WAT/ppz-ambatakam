[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=16106805&assignment_repo_type=AssignmentRepo)
# ppz_empty_with_gitignore

# Waifus vs Nazis

### 1. Tytuł projektu
**"Waifus vs Nazis – Gra Komputerowa"**  
Zabawna gra komputerowa typu **tower defense**, w której gracze wykorzystują postacie anime (waifu) do obrony przed falami nazistów. Gra bazuje na mechanice znanej z **Plants vs Zombies**.

### 2. Skład zespołu
- **Jerzy Szymczuk**  
- **Igor Olejniczak**  
- **Paweł Pawlikowski**

### 3. Cel projektu
Celem jest stworzenie gry komputerowej, w której gracz kontroluje drużynę waifu i strategicznie rozmieszcza je na planszy, aby bronić bazy przed nadciągającymi falami przeciwników. Gra ma być prosta w mechanice, ale wciągająca, z możliwością rozwoju postaci i zabawną oprawą wizualną.

### 4. Główne funkcje

1. **Tower Defense**:  
   Gracz rozmieszcza waifu, aby odpierać ataki nazistów. Każda postać ma unikalne umiejętności, które należy strategicznie wykorzystywać.

2. **System ulepszeń**:  
   Możliwość rozwijania waifu, zdobywania nowych umiejętności i zwiększania ich siły.

3. **Fale przeciwników**:  
   Różne rodzaje nazistów o różnej sile, co wymaga adaptacji i odpowiedniej strategii w miarę postępu gry.

4. **Ekonomia gry**:  
   Gracz zdobywa zasoby potrzebne do rozmieszczania waifu i ich ulepszania.

5. **Ranking i wyzwania**:  
   Gra będzie oferować poziomy o rosnącej trudności oraz system rankingowy dla najlepszych wyników.

### 5. Technologie
- **Unity** – silnik gry.
- **C#** – język skryptowy dla Unity.
- **SQLite** – baza danych do przechowywania wyników i postępów w grze.

### 6. Harmonogram prac

**Etap 1: Mechanika podstawowa**  
- **Jerzy Szymczuk**: Implementacja ruchu przeciwników po planszy.  
- **Igor Olejniczak**: Implementacja planszy i rozmieszczania waifu.  
- **Paweł Pawlikowski**: Implementacja systemu zapisu wyników w SQLite oraz pomoc przy tworzeniu interfejsu do umieszczania waifu na planszy.

**Etap 2: Postacie i przeciwnicy**  
- **Jerzy Szymczuk**: Stworzenie kilku różnych typów przeciwników (różne umiejętności, HP, szybkość).  
- **Igor Olejniczak**: Stworzenie kilku postaci waifu z różnymi umiejętnościami.  
- **Paweł Pawlikowski**: Implementacja systemu zasobów do rozmieszczania waifu oraz prace nad integracją bazy danych SQLite z postępami gracza.

**Etap 3: Ulepszenia i rozwój postaci**  
- **Jerzy Szymczuk**: Dodanie systemu poziomów dla waifu oraz mechaniki rozwoju postaci.  
- **Igor Olejniczak**: Implementacja ulepszeń waifu w trakcie rozgrywki.  
- **Paweł Pawlikowski**: Rozszerzenie bazy danych SQLite o zapisywanie postępu rozwoju waifu oraz praca nad powiadomieniami i informacją zwrotną dla gracza (np. punkty doświadczenia).

**Etap 4: Testowanie i balansowanie gry**  
- **Jerzy Szymczuk**: Testowanie poziomu trudności gry i balansowanie umiejętności przeciwników.  
- **Igor Olejniczak**: Optymalizacja rozgrywki, testowanie mechaniki obrony i ulepszania waifu.  
- **Paweł Pawlikowski**: Testowanie poprawności działania bazy danych, naprawa błędów związanych z zapisywaniem i wczytywaniem postępu.

### 7. Kryteria sukcesu
- Stabilna rozgrywka z odpowiednim poziomem trudności.
- Waifu mają różnorodne umiejętności, które gracz może strategicznie rozwijać.
- Działający system zapisywania wyników i postępów w SQLite.

### 8. Ryzyka
- Problemy z balansem rozgrywki (regularne testowanie pomoże w wykryciu problemów).  
- Integracja SQLite może sprawić trudności, ale zostanie zaadresowana przez Pawła na wczesnym etapie projektu.
