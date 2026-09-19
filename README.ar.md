[English](./README.md) · **العربية**

# Tasky (تاسكي)

<p align="center">
  <img src="assets/logo.png" alt="Tasky" width="128" />
</p>

<p align="center">
  <b>مجلدات. مهام. بأسلوبك الخاص.</b><br/>
  تطبيق مهام Flutter ملوّن مع شاشات ترحيب، مجلدات بسمات، حركات سحب، وحفظ محلي.
</p>

<p align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white" />
  <img alt="Dart" src="https://img.shields.io/badge/Dart-3.8-0175C2?style=flat-square&logo=dart&logoColor=white" />
  <img alt="Material3" src="https://img.shields.io/badge/Material-3-FC579D?style=flat-square" />
  <img alt="Storage" src="https://img.shields.io/badge/Storage-shared__preferences-purple?style=flat-square" />
</p>

---

## لماذا أُنشئ هذا التطبيق

تطبيقات المهام لا تحتاج إلى خلفية (Backend) لتبدو فاخرة.

Tasky هو عميل Flutter يعمل دون اتصال بالكامل، مع مسار ترحيب مصقول، ولون سمة خاص بكل مستخدم + وضع داكن، وتنظيم قائم على المجلدات، و`AppState` مركزي يحفظ تلقائيًا إلى `shared_preferences`.

## الميزات

| المجال | ما الذي تحصل عليه |
|------|----------------|
| الترحيب | مرحبًا بك → لون السمة → الاسم → الصورة الرمزية |
| المجلدات | إنشاء مجلدات مع موسّعات لتنظيم العمل |
| المهام | إضافة، إكمال، حذف بالسحب |
| التخصيص | سمة بلون جذري، تبديل فاتح/داكن، تغيير الصورة الرمزية |
| الحفظ | ملف الشخصية والمجلدات والمهام محفوظة محليًا |
| الحركة | لمسات Lottie، انتقالات صفحات، رأس رئيسية قابلة للسحب |
| الهوية البصرية | أيقونة وإطار بدء مخصّصان من `assets/logo.png` |

## تدفق المستخدم

```text
شاشات الترحيب
  → اختر اللون المفضل (+ الوضع الداكن)
  → أدخل الاسم
  → اختر الصورة الرمزية
  → الرئيسية: المجلدات + زر الإضافة
  → افتح مجلدًا → أدر المهام
  → الإعدادات: الملف الشخصي / السمة / إعادة تشغيل الترحيب
```

## عرض توضيحي

![عرض التطبيق](showcase/video.gif)

## لقطات الشاشة

### الترحيب
<table>
  <tr>
    <td align="center"><img src="showcase/onboarding-1.jpg" alt="الترحيب 1" width="180"/></td>
    <td align="center"><img src="showcase/onboarding-2.jpg" alt="الترحيب 2" width="180"/></td>
    <td align="center"><img src="showcase/theme-color.jpg" alt="لون السمة" width="180"/></td>
    <td align="center"><img src="showcase/theme-color-dark.jpg" alt="السمة الداكنة" width="180"/></td>
  </tr>
  <tr>
    <td align="center"><img src="showcase/name.jpg" alt="الاسم" width="180"/></td>
    <td align="center"><img src="showcase/avatar.jpg" alt="الصورة الرمزية" width="180"/></td>
  </tr>
</table>

### الرئيسية والمهام
<table>
  <tr>
    <td align="center"><img src="showcase/home.jpg" alt="الرئيسية" width="180"/></td>
    <td align="center"><img src="showcase/home-dark.jpg" alt="الرئيسية الداكنة" width="180"/></td>
    <td align="center"><img src="showcase/create-folder.jpg" alt="إنشاء مجلد" width="180"/></td>
    <td align="center"><img src="showcase/tasks.jpg" alt="المهام" width="180"/></td>
  </tr>
</table>

## المعمارية

```text
┌──────────────────┐     ┌─────────────────────┐     ┌──────────────────┐
│  Features / UI   │ ──▶ │  AppState           │ ──▶ │  LocalStorage    │
│  onboarding      │     │  ValueNotifiers     │     │  shared_prefs    │
│  home · settings │     │  folders · profile  │     │  JSON folders    │
└──────────────────┘     └─────────────────────┘     └──────────────────┘
```

**فصل المسؤوليات**
- `features/` — الشاشات ووودجت الميزات (الترحيب، الرئيسية، الإعدادات)
- `core/state` — `AppState` مع `ValueNotifier`s ومستمعات حفظ تلقائي
- `core/storage` — `LocalStorage` يغلّف `shared_preferences`
- `core/models` — `Folder` · `Task`
- `shared/widgets` — منتقي الألوان، منتقي الصورة الرمزية، مبدّل السمة

## هيكل المشروع

```text
lib/
├── main.dart                 # التمهيد — تحميل AppState، تشغيل التطبيق
├── app.dart                  # MaterialApp + ColorScheme ديناميكي
├── core/
│   ├── constants/            # الألوان، الأصول، النصوص
│   ├── models/               # Task, Folder
│   ├── state/                # AppState (notifiers + خطافات الحفظ)
│   └── storage/              # LocalStorage
├── features/
│   ├── onboarding/           # ترحيب → سمة → اسم → صورة رمزية
│   ├── home/                 # المجلدات والمهام وزر الإضافة والرأس
│   └── settings/             # الملف الشخصي، السمة، إعادة تشغيل الترحيب
└── shared/widgets/           # عناصر تحكم تخصيص قابلة لإعادة الاستخدام

assets/                       # الشعار، الصور الرمزية، lotties، Poppins، SVGs
showcase/                     # لقطات شاشة + فيديو توضيحي
```

## التقنيات المستخدمة

| الطبقة | الاختيار |
|-------|--------|
| الإطار | Flutter · Dart `^3.8.1` · Material 3 |
| الحالة | `ValueNotifier` + `AppState` مركزي |
| الحفظ | `shared_preferences` |
| الخطوط | Poppins مضمّنة · لمسات `google_fonts` |
| الحركة | `lottie` · `page_transition` · `draggable_home` · `animations` |
| إضافات UI | `flex_color_picker` · `google_nav_bar` · `blobs` · صور رمزية SVG |

القائمة الكاملة: [`pubspec.yaml`](pubspec.yaml)

## البدء

**المتطلبات الأساسية**
- Flutter SDK (إصدار 3.8+)
- Android SDK / محاكٍ أو جهاز

```bash
git clone https://github.com/baraa404/Tasky.git
cd Tasky
flutter pub get
flutter run
```

### الأيقونة وشاشة الإقلاع

```bash
dart run flutter_launcher_icons
dart run flutter_native_splash:create
```

## ملاحظات للمراجعين

- اسم الحزمة في `pubspec.yaml` هو `todoapp`؛ الاسم التجاري للمنتج هو **Tasky**.
- يعمل دون اتصال بالكامل — بلا مصادقة ولا خلفية.
- السمة الافتراضية بلون وردي دافئ (`#ff8796` / إقلاع `#FC579D`) حتى يختار المستخدم لونه.

## الترخيص

مشروع شخصي / بورتفوليو — استخدمه وعدّله كما يحلو لك.