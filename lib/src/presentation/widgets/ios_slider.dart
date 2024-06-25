import 'package:flutter/material.dart';
import 'package:moniehomes/src/config/config.dart';

class IosSlider extends StatefulWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final String text;

  const IosSlider({
    required this.text,
    required this.height,
    required this.width,
    this.backgroundColor = Colors.white,
  });

  @override
  _IosSliderState createState() => _IosSliderState();
}

class _IosSliderState extends State<IosSlider> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _avatarPositionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _widthAnimation = Tween<double>(
      begin: widget.width * 0.1,
      end: widget.width * 0.9,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _avatarPositionAnimation = Tween<double>(
      begin: 0.0,
      end: widget.width * 0.9 - widget.height, // Ensure the avatar stops within the container
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: widget.height,
          width: _widthAnimation.value,
          decoration: BoxDecoration(
            color: widget.backgroundColor.withOpacity(.4),
            borderRadius: BorderRadius.all(Radius.circular(widget.width * .2)),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  widget.text,
                  style: TextStyle(color: AppColors.appBlack, fontSize: widget.width * .05),
                ),
              ),
              Positioned(
                left: _avatarPositionAnimation.value,
                top: 0,
                bottom: 0,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: CircleAvatar(
                    radius: widget.height * .4,
                    backgroundColor: widget.backgroundColor,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
