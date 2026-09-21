import '../../data/models/service_model.dart';
import '../../data/models/project_model.dart';

class AppData {
  static const String companyName = 'شركة الجواد الدولية العربية';
  static const String totalProjectsCount = '1,450+ مشروع';
  
  static final List<ServiceModel> services = [
    ServiceModel(id: '1', title: 'النظافة العامة', icon: 'cleaning_services', description: 'التنظيف العميق للمنازل، الفلل، القصور، الفنادق، والمستشفيات ما بعد الإنشاء.'),
    ServiceModel(id: '2', title: 'تنظيف الواجهات', icon: 'window', description: 'تنظيف الواجهات الزجاجية والكلادينج والأبراج المرتفعة باستخدام معدات الرفع الاحترافية.'),
    ServiceModel(id: '3', title: 'تنظيف المواقف والمنشآت', icon: 'local_parking', description: 'جلي وتلميع الأرضيات، إزالة الزيوت وآثار الإطارات للمصانع والمستودعات والمواقف.'),
    ServiceModel(id: '4', title: 'مكافحة الآفات والتبخير', icon: 'bug_report', description: 'إبادة الحشرات الزاحفة والطائرة، القوارض، ومكافحة الطيور مع برامج الوقاية الدورية.'),
    ServiceModel(id: '5', title: 'العزل المائي والحراري', icon: 'layers', description: 'معالجة تسربات المياه، الحماية من الرطوبة، وعزل الخزانات بمواد الإيبوكسي المعتمدة.'),
    ServiceModel(id: '6', title: 'توفير العمالة المتخصصة', icon: 'people', description: 'تأمين العمالة المساندة والدائمة للفنادق، المطاعم، المصانع، والشركات.'),
  ];

  static final List<ProjectModel> projects = [
    ProjectModel(id: '1', title: 'مشروع تنظيف برج العليا التجاري', category: 'تنظيف الواجهات', description: 'تنظيف الواجهات الزجاجية الخارجية بالكامل لأحد أكبر الأبراج التجارية في الرياض.'),
    ProjectModel(id: '2', title: 'عزل خزانات مجمع السكني', category: 'العزل', description: 'معالجة التسربات وعزل مائي وحراري لـ 12 خزان مياه رئيسي بمواد آمنة وصديقة للبيئة.'),
  ];
}