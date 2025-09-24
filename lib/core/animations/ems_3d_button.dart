import 'package:flutter/material.dart';

class EMS3DButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  const EMS3DButton({super.key, required this.label, this.onTap});

  @override
  State<EMS3DButton> createState() => _EMS3DButtonState();
}

class _EMS3DButtonState extends State<EMS3DButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..translate(0.0, _controller.value * -2.0)
              ..scale(1.0 - _controller.value * 0.1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0033A0), Color(0xFF002244)],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, _controller.value * 5),
                  ),
                ],
              ),
              child: Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
