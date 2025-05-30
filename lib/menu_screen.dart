import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 8),
            const Text(
              'Menu',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // User Profile Card
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // User Profile Avatar with Percentage Indicator
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      value: 0.9, // 90% completion
                                      strokeWidth: 3,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                                      backgroundColor: Colors.grey[300],
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: const NetworkImage('https://randomuser.me/api/portraits/women/44.jpg'),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 12),
                              // User Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Neha Samuel',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              '4.5',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          'Virtual ID',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          '12 Reviews',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.green,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              const Text('682035'),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Change',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.green,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Favorite and Documents Row
                    Row(
                      children: [
                        Expanded(
                          child: _buildMenuButton(
                            icon: Icons.favorite_border,
                            label: 'Favourite',
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildMenuButton(
                            icon: Icons.description_outlined,
                            label: 'Documents',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Menu Items List
                    _buildMenuItem(
                      icon: Icons.account_balance_wallet_outlined,
                      label: 'Account Summary',
                      onPressed: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.event_note_outlined,
                      label: 'Activity Log',
                      onPressed: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.notifications_none,
                      label: 'Notifications',
                      onPressed: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.lock_outline,
                      label: 'Change Password',
                      onPressed: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.access_time,
                      label: 'Shift History',
                      onPressed: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.settings_outlined,
                      label: 'Notification Settings',
                      onPressed: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.account_balance_wallet_outlined,
                      label: 'Holiday Pay',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),

                    // FAQ and Logout Buttons
                    _buildMenuItem(
                      icon: Icons.question_answer_outlined,
                      label: 'FAQ',
                      onPressed: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.logout,
                      label: 'Logout',
                      onPressed: () {},
                      textColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Chat with Us Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.chat_bubble_outline),
              label: const Text(
                'Chat with US',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color? textColor,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: textColor ?? Colors.black54,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: textColor ?? Colors.black87,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          size: 20,
        ),
        onTap: onPressed,
      ),
    );
  }
}
