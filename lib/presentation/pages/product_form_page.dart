import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../model/products_response.dart';
import '../../providers/providers.dart';

class ProductFormPage extends ConsumerStatefulWidget {
  final int? id;
  const ProductFormPage({super.key, this.id});

  @override
  ConsumerState<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends ConsumerState<ProductFormPage> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  Category selectedCategory = Category.electronics;

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.dispose();
  }

  void _saveProduct() {
    final producto = ProductResponse(
      id: widget.id ?? DateTime.now().millisecondsSinceEpoch,
      title: titleController.text,
      price: double.tryParse(priceController.text) ?? 0,
      description: descriptionController.text,
      category: selectedCategory,
      image: imageController.text,
      rating: Rating(count: 0, rate: 0.0),
    );

    final notifier = ref.read(localProductsProvider.notifier);
    if (widget.id == null) {
      notifier.agregarProducto(producto);
    } else {
      notifier.actualizarProducto(producto);
    }

    context.go('/home');
  }

  @override
  void initState() {
    super.initState();

    if (widget.id != null) {
      final producto = ref
          .read(localProductsProvider)
          .firstWhere((p) => p.id == widget.id);

      titleController.text = producto.title;
      priceController.text = producto.price.toString();
      descriptionController.text = producto.description;
      imageController.text = producto.image;
      selectedCategory = producto.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Producto'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              _FormText(
                controller: titleController, 
                label: 'Título', 
                error: 'Ingrese un título'
              ),
              const SizedBox(height: 12),
              _FormText(
                controller: priceController,
                label: 'Precio',
                error: 'Ingrese un precio',
                isNumber: true,
              ),
              const SizedBox(height: 12),
              _FormText(
                controller: descriptionController,
                label: 'Descripción',
                error: 'Ingrese una descripción',
              ),
              const SizedBox(height: 12),
              _FormText(
                controller: imageController,
                label: 'URL de imagen',
                error: 'Ingrese una URL de imagen',
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<Category>(
                value: selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Categoría',
                  border: OutlineInputBorder(),
                ),
                items:
                    Category.values.map((cat) {
                      return DropdownMenuItem<Category>(
                        value: cat,
                        child: Text(cat.name),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => selectedCategory = value);
                  }
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _saveProduct,
                icon: const Icon(Icons.save),
                label: const Text('Guardar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String error;
  final bool isNumber;

  const _FormText({
    required this.controller, 
    required this.label, 
    required this.error,
    this.isNumber = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator:
          (value) => value == null || value.trim().isEmpty ? error : null,
    );
  }
}
