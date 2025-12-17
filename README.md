# เกม XO (Tic-Tac-Toe) - Flutter Mobile Application

เกม Tic-Tac-Toe บนมือถือ รองรับการปรับขนาดกระดานแบบ n × n ระบบรีเพลย์ และบันทึกประวัติเกมด้วย SQLite

---

## ฟีเจอร์

- ปรับขนาดกระดานได้แบบไดนามิก (3×3 ถึง 20×20)
- โหมดเกมหลากหลาย: 2 ผู้เล่น และ ผู้เล่น vs Bot (AI)
- ระบบรีเพลย์เกมพร้อม Auto-play
- บันทึกประวัติเกมถาวรด้วยฐานข้อมูล SQLite (Local)
- ลบประวัติเกมแต่ละรายการได้
- เล่นได้แบบ Offline

---

## เทคโนโลยีที่ใช้

### Frontend (Mobile App)
- **Flutter SDK** - Framework สำหรับพัฒนา Mobile App
- **Dart** - ภาษาโปรแกรมของ Flutter

### Backend (Local)
- **SQLite** - ฐานข้อมูลในเครื่องสำหรับเก็บประวัติเกม
- **sqflite package** - SQLite plugin สำหรับ Flutter
- **path package** - จัดการ path ของไฟล์

### Development Tools
- **VS Code** - Code Editor
- **Android Studio** - Android Emulator

---

## สิ่งที่ต้องติดตั้งก่อน

ก่อนเริ่มต้น โปรดตรวจสอบว่าคุณได้ติดตั้งสิ่งต่อไปนี้แล้ว:

### 1. Git
ดาวน์โหลดและติดตั้งจาก: https://git-scm.com/downloads

ตรวจสอบการติดตั้ง:
```bash
git --version
# ควรแสดง: git version 2.x.x
```

### 2. Flutter SDK
ดาวน์โหลดและติดตั้ง Flutter จาก: https://flutter.dev/docs/get-started/install

**Windows:**
```bash
# ดาวน์โหลด Flutter SDK
# แตกไฟล์ไปที่ C:\src\flutter

# เพิ่ม Flutter ใน PATH
# System Environment Variables → Path → New → C:\src\flutter\bin

# ตรวจสอบการติดตั้ง
flutter doctor
```

### 3. Android Studio
ดาวน์โหลดจาก: https://developer.android.com/studio

ขั้นตอนการติดตั้ง:
1. ติดตั้ง Android Studio
2. เปิด Android Studio → More Actions → SDK Manager
3. ติดตั้ง:
   - Android SDK Platform (เวอร์ชันล่าสุด)
   - Android SDK Build-Tools
   - Android Emulator
4. ไปที่ Tools → Device Manager → Create Device
5. เลือก device (เช่น Pixel 6) → เลือก System Image (Android 13) → Finish

### 4. VS Code
ดาวน์โหลดจาก: https://code.visualstudio.com/

ติดตั้ง Extensions:
1. เปิด VS Code
2. กด Ctrl+Shift+X
3. ค้นหาและติดตั้ง:
   - Flutter (by Dart Code)
   - Dart (by Dart Code)

### 5. ตรวจสอบการติดตั้ง
```bash
flutter doctor
```

ผลลัพธ์ที่ต้องการ:
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x)
[✓] Android toolchain - develop for Android devices
[✓] Android Studio (version 2024.x)
[✓] VS Code (version 1.x)
[✓] Connected device (1 available)
```

---

## การติดตั้งโปรเจค

### ขั้นตอนที่ 1: Clone โปรเจคจาก GitHub
```bash
# เปิด Command Prompt หรือ Terminal
cd C:\Users\YourName\Desktop

# Clone โปรเจค
git clone https://github.com/Nattapon-663040649-4/xo_game.git

# เข้าไปในโฟลเดอร์โปรเจค
cd xo_game
```

### ขั้นตอนที่ 2: ติดตั้ง Dependencies
```bash
# ติดตั้ง packages ที่จำเป็น
flutter pub get
```

คำสั่งนี้จะติดตั้ง:
- sqflite (SQLite database)
- path (จัดการ file paths)
- และ dependencies อื่นๆ ที่ระบุใน pubspec.yaml

### ขั้นตอนที่ 3: เปิดโปรเจคใน VS Code
```bash
# เปิด VS Code ที่โฟลเดอร์ปัจจุบัน
code .
```

หรือ:
1. เปิด VS Code
2. File → Open Folder
3. เลือกโฟลเดอร์ `xo_game`

### ขั้นตอนที่ 4: ตรวจสอบโครงสร้างโปรเจค

หลัง clone เสร็จ โปรเจคจะมีโครงสร้างดังนี้:
```
xo_game/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── game_state.dart
│   ├── services/
│   │   ├── database_helper.dart
│   │   └── ai_player.dart
│   ├── screens/
│   │   ├── main_menu_screen.dart
│   │   ├── game_setup_screen.dart
│   │   ├── game_screen.dart
│   │   ├── history_screen.dart
│   │   └── replay_screen.dart
│   └── widgets/
│       └── game_board.dart
├── android/
├── pubspec.yaml
├── .gitignore
└── README.md
```

---

## วิธีการรันโปรแกรม

### วิธีที่ 1: ใช้ VS Code (แนะนำ)

1. **เปิด Android Emulator**
   - เปิด Android Studio
   - More Actions → Virtual Device Manager
   - กดปุ่มเริ่มต้นที่ device ที่สร้างไว้

2. **รันโปรแกรมจาก VS Code**
   ```bash
   # ใน VS Code Terminal
   flutter run
   ```
   
   หรือ:
   - กด F5
   - หรือ View → Command Palette (Ctrl+Shift+P)
   - พิมพ์: Flutter: Select Device → เลือก emulator
   - กด F5 อีกครั้ง

3. **รอ Build**
   - ครั้งแรกจะใช้เวลา 2-5 นาที
   - ครั้งต่อไปจะเร็วขึ้น

### วิธีที่ 2: ใช้ Command Line
```bash
# ตรวจสอบ device ที่เชื่อมต่อ
flutter devices

# รันโปรแกรม
flutter run
```

### วิธีที่ 3: รันบนโทรศัพท์จริง

1. **เปิด Developer Options บนโทรศัพท์**
   - Settings → About Phone → กด Build Number 7 ครั้ง
   - กลับไป Settings → Developer Options → เปิด USB Debugging

2. **เชื่อมต่อสาย USB**
   ```bash
   # ตรวจสอบว่าเชื่อมต่อสำเร็จ
   flutter devices
   
   # รันโปรแกรม
   flutter run
   ```

---

## วิธีการเล่น

### เริ่มเกมใหม่

1. **เลือกโหมดเกม**
   - **2 Players** - เล่นกับเพื่อนบนเครื่องเดียวกัน
   - **vs Bot** - เล่นกับ AI (ระดับยาก)

2. **กำหนดขนาดกระดาน**
   - พิมพ์ตัวเลข 3-20 (แนะนำ 3-8 สำหรับประสบการณ์ที่ดี)
   - ตัวอย่าง: `3` = กระดาน 3×3, `5` = กระดาน 5×5

3. **กด Start Game**

### เล่นเกม

- **ผู้เล่น X** เริ่มก่อนเสมอ
- แตะที่ช่องว่างเพื่อวางเครื่องหมาย
- เกมจะสลับเทิร์นอัตโนมัติ
- เกมจบเมื่อมีผู้ชนะหรือเสมอ

### ดูประวัติเกม

1. กดปุ่ม **Game History** ที่หน้าเมนูหลัก
2. แสดงรายการเกมทั้งหมดที่เล่นมา
3. แต่ละรายการแสดง:
   - ขนาดกระดาน (3×3, 4×4, ...)
   - ผู้ชนะ (X, O, หรือ Draw)
   - โหมดเกม (2 Players หรือ vs Bot)
   - วันเวลาที่เล่น

### ดู Replay

1. ในหน้า Game History คลิกที่ปุ่มเล่นของเกมที่ต้องการ
2. ใช้ปุ่มควบคุม:
   - รีเซ็ตกลับไปจุดเริ่มต้น
   - ถอยหลังหนึ่งตา
   - เล่นอัตโนมัติ
   - เดินหน้าหนึ่งตา

### ลบประวัติ

- คลิกปุ่มถังขยะสีแดงด้านขวาของแต่ละรายการ

---

## การออกแบบและ Architecture

### System Architecture

โปรแกรมออกแบบแบบ **Layered Architecture** แยกเป็น 4 ชั้น:

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│         (Screens & Widgets)             │
│  - Main Menu Screen                     │
│  - Game Setup Screen                    │
│  - Game Screen                          │
│  - History Screen                       │
│  - Replay Screen                        │
└─────────────┬───────────────────────────┘
              │
┌─────────────▼───────────────────────────┐
│         Business Logic Layer            │
│              (Models)                   │
│  - GameState (game logic)               │
│  - Move validation                      │
│  - Win detection                        │
└─────────────┬───────────────────────────┘
              │
┌─────────────▼───────────────────────────┐
│          Service Layer                  │
│  - AIPlayer (bot logic)                 │
│  - DatabaseHelper (data persistence)    │
└─────────────┬───────────────────────────┘
              │
┌─────────────▼───────────────────────────┐
│         Data Layer                      │
│         (SQLite Database)               │
│  - games table (game records)           │
└─────────────────────────────────────────┘
```

### Project Structure
```
lib/
├── main.dart                 # Entry point, MaterialApp setup
├── models/                   # Data models & business logic
│   └── game_state.dart      # Game state management, win detection
├── services/                 # Backend services
│   ├── database_helper.dart # SQLite operations
│   └── ai_player.dart       # AI algorithm
├── screens/                  # UI screens (pages)
│   ├── main_menu_screen.dart
│   ├── game_setup_screen.dart
│   ├── game_screen.dart
│   ├── history_screen.dart
│   └── replay_screen.dart
└── widgets/                  # Reusable UI components
    └── game_board.dart      # Game board grid widget
```

### Database Schema
```sql
CREATE TABLE games(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  gridSize INTEGER NOT NULL,          -- ขนาดกระดาน (3, 4, 5, ...)
  moves TEXT NOT NULL,                -- การเดินทั้งหมด (format: "X:0,O:4,X:1,...")
  winner TEXT NOT NULL,               -- ผู้ชนะ (X, O, หรือ Draw)
  gameMode TEXT NOT NULL,             -- โหมด (2 Players หรือ vs Bot)
  timestamp TEXT NOT NULL             -- วันเวลา (ISO 8601 format)
)
```

ตัวอย่างข้อมูล:
```json
{
  "id": 1,
  "gridSize": 3,
  "moves": "X:0,O:4,X:1,O:3,X:2",
  "winner": "X",
  "gameMode": "vs Bot",
  "timestamp": "2025-12-17T10:30:00.000Z"
}
```

---

## Algorithms ที่ใช้

### 1. Win Detection Algorithm

**Algorithm:** Pattern Matching with Dynamic Pattern Generation

**หลักการ:**
สร้าง winning patterns ทั้งหมดที่เป็นไปได้สำหรับกระดาน N×N จากนั้นตรวจสอบว่าผู้เล่นปัจจุบันครองครบทุกช่องใน pattern ใดหรือไม่

**ขั้นตอน:**

1. **สร้าง Horizontal Patterns (แถว)**
   ```
   สำหรับกระดาน 3×3:
   Row 0: [0, 1, 2]
   Row 1: [3, 4, 5]
   Row 2: [6, 7, 8]
   ```

2. **สร้าง Vertical Patterns (คอลัมน์)**
   ```
   Col 0: [0, 3, 6]
   Col 1: [1, 4, 7]
   Col 2: [2, 5, 8]
   ```

3. **สร้าง Diagonal Patterns (เส้นทแยงมุม)**
   ```
   Diagonal 1 (↘): [0, 4, 8]
   Diagonal 2 (↙): [2, 4, 6]
   ```

4. **ตรวจสอบแต่ละ Pattern**
   ```dart
   // Check rows
   for (int row = 0; row < gridSize; row++) {
     bool win = true;
     for (int col = 0; col < gridSize; col++) {
       int index = row * gridSize + col;
       if (board[index] != currentPlayer) {
         win = false;
         break;
       }
     }
     if (win) return true;
   }
   ```

**Time Complexity:** O(N²)
- ต้องตรวจสอบ 2N+2 patterns (N แถว + N คอลัมน์ + 2 ทแยง)
- แต่ละ pattern มี N ช่อง
- รวม: O(N × N) = O(N²)

**Space Complexity:** O(1)
- ไม่ต้องเก็บ patterns ไว้ในหน่วยความจำ
- คำนวณ on-the-fly

---

### 2. AI Algorithm (Minimax-inspired Strategy)

**Algorithm:** Strategic Move Selection with Priority Queue

**หลักการ:**
AI จะเลือกการเดินที่ดีที่สุดโดยพิจารณาตามลำดับความสำคัญ:

**Priority Queue:**
```
1. Win Move     (น้ำหนัก: 100) - ชนะได้ทันที
2. Block Move   (น้ำหนัก: 90)  - บลอกฝ่ายตรงข้ามที่กำลังจะชนะ
3. Center       (น้ำหนัก: 60)  - ตรงกลางกระดาน
4. Corner       (น้ำหนัก: 40)  - มุมทั้ง 4
5. Random       (น้ำหนัก: 10)  - ช่องว่างที่เหลือ
```

**Implementation:**
```dart
int getBestMove(GameState game) {
  List<int> available = game.getAvailableMoves();
  
  // 1. Can I win? → Take it!
  for (int move in available) {
    GameState test = game.clone();
    test.makeMove(move);
    if (test.winner == 'O') return move;  // AI is 'O'
  }
  
  // 2. Will opponent win? → Block it!
  for (int move in available) {
    GameState test = game.clone();
    test.currentPlayer = 'X';  // Simulate opponent
    test.makeMove(move);
    if (test.winner == 'X') return move;
  }
  
  // 3. Take center if available
  int center = (game.gridSize * game.gridSize) ~/ 2;
  if (available.contains(center)) return center;
  
  // 4. Take corner
  List<int> corners = [0, N-1, N*(N-1), N*N-1];
  for (int corner in corners) {
    if (available.contains(corner)) return corner;
  }
  
  // 5. Take any random move
  return available[random.nextInt(available.length)];
}
```

**Time Complexity:** O(N²)
- ขั้นที่ 1-2: ตรวจสอบทุกช่องว่าง × clone และ check winner
- ขั้นที่ 3-5: O(1) หรือ O(4)
- รวม: O(N²)

**Space Complexity:** O(N²)
- ต้อง clone GameState สำหรับการจำลอง

---

### 3. Replay System Algorithm

**Algorithm:** Event Sourcing Pattern

**หลักการ:**
เก็บทุก event (การเดิน) เป็น immutable log จากนั้น reconstruct state โดยการ replay events ตามลำดับ

**Data Structure:**
```dart
class Move {
  final String player;  // 'X' หรือ 'O'
  final int index;      // 0 ถึง N²-1
}

List<Move> moves = [];  // Event log
```

**Storage Format:**
```
"X:0,O:4,X:1,O:3,X:2"
  │   │   │   │   │  
  │   │   │   │   └──────── player X, index 2
  │   │   │   └──────────── player O, index 3
  │   │   └───────────────── player X, index 1
  │   └──────────────────── player O, index 4
  └─────────────────────── player X, index 0
```

**Operations:**

1. **Record Move**
   ```dart
   void recordMove(String player, int index) {
     moves.add('$player:$index');
   }
   ```
   - Time: O(1)
   - Space: O(1) per move

2. **Replay to Move N**
   ```dart
   void replayToMove(int n) {
     board = List.filled(size*size, '');
     for (int i = 0; i < n; i++) {
       var parts = moves[i].split(':');
       board[int.parse(parts[1])] = parts[0];
     }
   }
   ```
   - Time: O(N)
   - Space: O(N²) for board

3. **Auto-play**
   ```dart
   void autoPlay() {
     timer = Timer.periodic(Duration(milliseconds: 800), (t) {
       if (currentMove < moves.length) {
         currentMove++;
         replayToMove(currentMove);
       } else {
         timer.cancel();
       }
     });
   }
   ```

---

### 4. Responsive Grid Sizing Algorithm

**Algorithm:** Adaptive Sizing with Constraints

**Problem:**
กระดานขนาด N×N ต้องพอดีกับหน้าจอทุกขนาด โดย:
- Cell ไม่เล็กเกินไป (อ่านยาก)
- Cell ไม่ใหญ่เกินไป (เล่นยาก)
- กระดานเป็นสี่เหลี่ยมจัตุรัส

**Solution:**
```dart
double calculateCellSize(int gridSize, double screenWidth, double screenHeight) {
  // 1. หาพื้นที่ใช้งานได้สูงสุด
  double maxWidth = screenWidth * 0.9;   // 90% ของความกว้าง
  double maxHeight = screenHeight * 0.7;  // 70% ของความสูง
  
  // 2. เลือกค่าที่เล็กกว่า (เพื่อให้เป็นสี่เหลี่ยมจัตุรัส)
  double maxBoardSize = min(maxWidth, maxHeight);
  
  // 3. คำนวณขนาด cell
  double gap = 4.0;  // ระยะห่างระหว่าง cell
  double cellSize = (maxBoardSize - (gridSize + 1) * gap) / gridSize;
  
  // 4. จำกัดขนาด
  cellSize = max(20.0, min(100.0, cellSize));
  
  return cellSize;
}
```

**Formula:**
```
cellSize = floor((maxBoardSize - (N+1) × gap) / N)
cellSize = max(minSize, min(maxSize, cellSize))
```

**Constraints:**
- Minimum: 20px (เล็กกว่านี้กดยาก)
- Maximum: 100px (ใหญ่กว่านี้ต้อง scroll)

---

## Flow การทำงานของโปรแกรม

### Flow ทั้งหมด
```
START
  ↓
┌─────────────────────┐
│  Main Menu Screen   │ ← แสดงตัวเลือก
│  - 2 Players        │
│  - vs Bot           │
│  - Game History     │
└──────────┬──────────┘
           │
    [เลือก Mode]
           │
           ↓
┌─────────────────────┐
│ Game Setup Screen   │ ← กรอกขนาดกระดาน
│  - Enter Grid Size  │
│  - Validate (3-20)  │
└──────────┬──────────┘
           │
    [Start Game]
           │
           ↓
┌─────────────────────┐
│   Game Screen       │
│  - Draw Board       │◄────┐
│  - Wait for Move    │     │
└──────────┬──────────┘     │
           │                │
    [Player taps cell]      │
           │                │
           ↓                │
    ┌──────────────┐        │
    │ Update Board │        │
    │ Check Winner │        │
    └──────┬───────┘        │
           │                │
    ┌──────▼───────┐        │
    │ Game Over?   │        │
    └──────┬───────┘        │
      YES  │  NO            │
           │  └─────────────┘
           │   (Switch player)
           ↓
    ┌──────────────┐
    │ Save to DB   │
    │ Show Dialog  │
    └──────┬───────┘
           │
    [View History]
           │
           ↓
┌─────────────────────┐
│  History Screen     │
│  - Load from DB     │
│  - Show List        │
└──────────┬──────────┘
           │
    [Select Game]
           │
           ↓
┌─────────────────────┐
│  Replay Screen      │
│  - Load Moves       │
│  - Auto-play        │
│  - Manual Control   │
└─────────────────────┘
```

### Flow การตรวจสอบการชนะ
```
Player makes move at index I
         ↓
  Update board[I] = currentPlayer
         ↓
  ┌─────────────────┐
  │  Check Winner   │
  └────────┬────────┘
           │
    ┌──────▼──────┐
    │ Check Rows  │ → All cells in any row = currentPlayer?
    └──────┬──────┘
           │ NO
    ┌──────▼──────┐
    │ Check Cols  │ → All cells in any column = currentPlayer?
    └──────┬──────┘
           │ NO
    ┌──────▼──────────┐
    │ Check Diagonal1 │ → All cells in diagonal (↘) = currentPlayer?
    └──────┬──────────┘
           │ NO
    ┌──────▼──────────┐
    │ Check Diagonal2 │ → All cells in diagonal (↙) = currentPlayer?
    └──────┬──────────┘
           │ NO
    ┌──────▼──────┐
    │ Check Draw  │ → All cells filled?
    └──────┬──────┘
           │
     ┌─────▼─────┐
     │  Result:  │
     │  - Win    │ → Game Over, show winner
     │  - Draw   │ → Game Over, show draw
     │  - None   │ → Continue, switch player
     └───────────┘
```

---

## Troubleshooting

### ปัญหาที่พบบ่อย

#### 1. Git clone ล้มเหลว
```bash
# ถ้า error: SSL certificate problem
git config --global http.sslVerify false
git clone https://github.com/Nattapon-663040649-4/xo_game.git

# หรือใช้ SSH แทน HTTPS
git clone git@github.com:Nattapon-663040649-4/xo_game.git
```

#### 2. Flutter command not found
```bash
# แก้ไข: เพิ่ม Flutter ใน PATH
# Windows:
# System Properties → Environment Variables → Path
# เพิ่ม: C:\src\flutter\bin
```

#### 3. flutter pub get ล้มเหลว
```bash
# ลบ cache แล้วลองใหม่
flutter clean
flutter pub get

# ถ้ายังไม่ได้
flutter pub cache repair
flutter pub get
```

#### 4. Android licenses not accepted
```bash
flutter doctor --android-licenses
# กด 'y' ยอมรับทุกข้อตกลง
```

#### 5. No devices found
```bash
# ตรวจสอบว่า emulator เปิดแล้ว
# Android Studio → Device Manager → Start device

# หรือเสียบโทรศัพท์จริง
# ตรวจสอบ USB Debugging เปิดแล้ว
```

#### 6. Build failed: Gradle error
```bash
# ลบ build cache
cd android
./gradlew clean

# กลับไปโฟลเดอร์หลัก
cd ..
flutter clean
flutter pub get
flutter run
```

#### 7. แอพ crash เมื่อเล่นตารางใหญ่

**สาเหตุ:** AI คำนวณนานเกินไป

**แก้ไข:** จำกัดขนาดตารางไว้ที่ 3-8 เท่านั้น

ถ้าต้องการแก้ใน code:

แก้ไขใน `lib/screens/game_setup_screen.dart`:
```dart
if (gridSize > 8) {
  setState(() {
    errorMessage = 'Maximum is 8 for smooth gameplay';
  });
  return;
}
```

---

## Performance Optimization

### แนวทางเพิ่มประสิทธิภาพ

1. **จำกัดขนาดตาราง**
   - แนะนำ: 3-8
   - สูงสุด: 10
   - เหตุผล: AI คำนวณเร็ว, UI smooth

2. **ใช้ const constructor**
   ```dart
   const Text('Hello')  // ดีกว่า
   Text('Hello')        // ช้ากว่า
   ```

3. **Limit database queries**
   ```dart
   // จำกัดจำนวน records ที่ query
   SELECT * FROM games ORDER BY timestamp DESC LIMIT 100

   ---

## ความปลอดภัยของข้อมูล

### การเก็บข้อมูล

- ข้อมูลเก็บใน **Local Storage เท่านั้น**
- **ไม่ส่งข้อมูลออกนอกเครื่อง**
- **ไม่มี Analytics** หรือ Tracking
- ถอนการติดตั้งแอพ = **ข้อมูลหายหมด**

### ข้อมูลจะหายเมื่อ:
- Uninstall แอพ
- Clear app data ในการตั้งค่า
- Factory reset เครื่อง

---

## License

โปรเจคนี้เป็นโอเพ่นซอร์สและใช้เพื่อการศึกษา

---

## Support

หากมีปัญหาหรือคำถาม:

1. ตรวจสอบ Troubleshooting ด้านบน
2. รัน `flutter doctor -v` แล้วเช็ค error
3. ดู console log ใน VS Code
4. สร้าง Issue บน GitHub: https://github.com/Nattapon-663040649-4/xo_game/issues

---

## Contact

- **GitHub Repository:** https://github.com/Nattapon-663040649-4/xo_game
- **Developer:** Nattapon Jongmeesuk

