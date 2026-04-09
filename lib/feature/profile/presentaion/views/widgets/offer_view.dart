import 'package:flutter/material.dart';

class Offerview extends StatelessWidget {
  const Offerview({super.key});
  static const routeName = 'Offerview';

  static const _blue = Color(0xFF2D6CDF);
  static const _bg = Color(0xFFF8F6F6);
  static const _textDark = Color(0xFF0F172A);
  static const _textMuted = Color(0xFF64748B);

  static const _drivers = <_DriverOffer>[
    _DriverOffer(
      name: 'أحمد محمد',
      price: '٤٠ ريال',
      rating: '4.8',
      reviews: '(١٢٠ تقييم)',
      distance: '٣.٥ كم بعيد',
      duration: 'ساعتان',
      avatarUrl:
          'https://www.figma.com/api/mcp/asset/a76dec0a-d930-4726-ae89-497fc5e552ba',
      online: true,
    ),
    _DriverOffer(
      name: 'سالم العتيبي',
      price: '٣٥ ريال',
      rating: '4.5',
      reviews: '(٨٥ تقييم)',
      distance: '١.٢ كم بعيد',
      duration: '٣ ساعات',
      avatarUrl:
          'https://www.figma.com/api/mcp/asset/3380e8ae-4541-4fff-8ac9-11d879987bd1',
    ),
    _DriverOffer(
      name: 'خالد الحربي',
      price: '٤٥ ريال',
      rating: '4.9',
      reviews: '(٢٠١ تقييم)',
      distance: '٥.٠ كم بعيد',
      duration: '٤٥ دقيقة',
      avatarUrl:
          'https://www.figma.com/api/mcp/asset/758c8137-0e41-49dd-b75f-fde4ca4a0662',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: _bg,
        appBar: AppBar(
          backgroundColor: _bg.withValues(alpha: 0.92),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'عروض المناديب',
            style: TextStyle(
              fontFamily: 'cairo',
              fontWeight: FontWeight.w700,
              color: _textDark,
              fontSize: 24,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(
              Icons.arrow_forward,
              color: _textDark,
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(height: 1, color: Color(0xFFE2E8F0)),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 96),
          child: Column(
            children: [
              _buildOrderInfoCard(),
              const SizedBox(height: 20),
              _buildActiveTab(),
              const SizedBox(height: 18),
              for (final offer in _drivers) ...[
                _OfferCard(offer: offer),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _blue.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _blue.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'طلب التوصيل #8842',
                style: TextStyle(
                  color: _blue,
                  fontFamily: 'cairo',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'منذ ١٥ دقيقة',
                style: TextStyle(
                  color: _textMuted,
                  fontFamily: 'cairo',
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _InfoRow(
            text: 'من: حي النرجس، الرياض',
            icon: Icons.location_on_outlined,
          ),
          const SizedBox(height: 4),
          _InfoRow(
            text: 'إلى: حي الملقا، الرياض',
            icon: Icons.navigation_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildActiveTab() {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'العروض النشطة (٤)',
            style: TextStyle(
              color: _blue,
              fontFamily: 'cairo',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 88,
            height: 2.4,
            decoration: BoxDecoration(
              color: _blue,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: const BoxDecoration(
        color: Color(0xE6FFFFFF),
        border: Border(top: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomItem(icon: Icons.person_outline, label: 'الملف الشخصي'),
          _BottomItem(
            icon: Icons.local_offer,
            label: 'العروض',
            isActive: true,
          ),
          _BottomItem(icon: Icons.receipt_long_outlined, label: 'طلباتي'),
          _BottomItem(icon: Icons.home_outlined, label: 'الرئيسية'),
        ],
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.offer});

  final _DriverOffer offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          offer.price,
                          style: const TextStyle(
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            color: Offerview._blue,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              offer.name,
                              style: const TextStyle(
                                fontFamily: 'cairo',
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: Offerview._textDark,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  offer.reviews,
                                  style: const TextStyle(
                                    fontFamily: 'cairo',
                                    fontSize: 13,
                                    color: Offerview._textMuted,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  offer.rating,
                                  style: const TextStyle(
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFFFACC15),
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _MetaChip(
                          icon: Icons.location_on_outlined,
                          text: offer.distance,
                        ),
                        const SizedBox(width: 16),
                        _MetaChip(
                          icon: Icons.access_time_outlined,
                          text: offer.duration,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      offer.avatarUrl,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (offer.online)
                    const Positioned(
                      left: -4,
                      bottom: -4,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Color(0xFF22C55E),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check_circle_outline, color: Colors.white),
              label: const Text(
                'قبول العرض',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Offerview._blue,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'cairo',
            fontSize: 13,
            color: Color(0xFF475569),
          ),
        ),
        const SizedBox(width: 4),
        Icon(icon, color: const Color(0xFF475569), size: 16),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Offerview._textDark,
            fontFamily: 'cairo',
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Icon(icon, color: Offerview._blue, size: 18),
      ],
    );
  }
}

class _BottomItem extends StatelessWidget {
  const _BottomItem({
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  final IconData icon;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? Offerview._blue : const Color(0xFF94A3B8);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 10,
            color: color,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _DriverOffer {
  const _DriverOffer({
    required this.name,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.duration,
    required this.avatarUrl,
    this.online = false,
  });

  final String name;
  final String price;
  final String rating;
  final String reviews;
  final String distance;
  final String duration;
  final String avatarUrl;
  final bool online;
}