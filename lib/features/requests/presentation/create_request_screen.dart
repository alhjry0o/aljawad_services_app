import 'package:flutter/material';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_data.dart';
import '../../../data/models/request_model.dart';
import '../../../data/repositories/local_repository.dart';
import 'package:go_router/go_router.dart';

class CreateRequestScreen extends ConsumerStatefulWidget {
  final String serviceId;
  final String flowType;
  const CreateRequestScreen({required this.serviceId, required this.flowType, super.key});

  @override
  ConsumerState<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends ConsumerState<CreateRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  String _selectedSite = 'منزل';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final service = AppData.services.firstWhere((e) => e.id == widget.serviceId, orElse: () => AppData.services.first);
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('تقديم طلب - ${widget.flowType == 'service' ? 'خدمة' : 'عرض سعر'}')),
        body: _isLoading 
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('الخدمة المطلوبة: ${service.title}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedSite,
                    decoration: const InputDecoration(labelText: 'نوع الموقع', border: OutlineInputBorder()),
                    items: ['منزل', 'فيلا', 'قصر', 'مكتب', 'مصنع', 'مستودع'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (v) => setState(() => _selectedSite = v!),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(labelText: 'العنوان بالتفصيل', border: OutlineInputBorder()),
                    validator: (v) => v!.isEmpty ? 'يرجى إدخال العنوان' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'الاسم الكريم', border: OutlineInputBorder()),
                    validator: (v) => v!.isEmpty ? 'يرجى إدخال الاسم' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(labelText: 'رقم الجوال', border: OutlineInputBorder()),
                    validator: (v) => v!.isEmpty ? 'يرجى إدخال رقم الجوال' : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50), backgroundColor: Theme.of(context).primaryColor, foregroundColor: Colors.white),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => _isLoading = true);
                        
                        final newRequest = ServiceRequestModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          serviceTitle: service.title,
                          type: widget.flowType,
                          siteType: _selectedSite,
                          city: 'الرياض',
                          address: _addressController.text,
                          date: DateTime.now().toString().split(' ')[0],
                          time: '10:00 ص',
                          clientName: _nameController.text,
                          clientPhone: _phoneController.text,
                          status: 'تم حفظ الطلب تجريبياً',
                        );

                        await ref.read(requestRepositoryProvider).saveRequest(newRequest);
                        setState(() => _isLoading = false);
                        
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم حفظ وتأكيد طلبك بنجاح في النسخة التجريبية')));
                          context.go('/requests');
                        }
                      }
                    },
                    child: const Text('تأكيد وإرسال الطلب', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}