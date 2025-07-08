# Learning Management System (LMS)

A modern, secure Learning Management System built with Next.js, TypeScript, and Tailwind CSS.

## Features

- 🔐 Secure authentication with admin approval
- 👨‍💼 Admin dashboard for user management
- 📚 Interactive learning modules
- 📝 Assessment system with quizzes
- 📊 Progress tracking
- 🎓 Certificate generation
- 📱 Responsive design
- 🔒 Data persistence

## Quick Start

### Prerequisites
- Node.js 18+ installed
- npm or yarn package manager

### Installation

1. **Clone the repository**
2. **Install dependencies:**
   \`\`\`bash
   npm install
   \`\`\`

3. **Run the development server:**
   \`\`\`bash
   npm run dev
   \`\`\`

4. **Open [http://localhost:3000](http://localhost:3000)**

### Login Credentials

**Admin Account:**
- Email: `janlo@ablig.co.za`
- Password: `admin@123`

**Student Account:**
- Email: `student@bligblue.com`
- Password: `student123`

## Available Scripts

\`\`\`bash
# Start development server
npm run dev

# Build for production
npm run build

# Start production server
npm start

# Run linting
npm run lint
\`\`\`

## Project Structure

\`\`\`
├── app/                    # Next.js app directory
│   ├── admin/             # Admin dashboard pages
│   ├── student/           # Student dashboard pages
│   ├── globals.css        # Global styles
│   ├── layout.tsx         # Root layout
│   └── page.tsx           # Home page
├── components/            # React components
│   ├── ui/               # UI components (buttons, cards, etc.)
│   ├── admin-dashboard.tsx
│   ├── student-dashboard.tsx
│   ├── auth-provider.tsx
│   └── ...
├── lib/                  # Utility functions
│   ├── data.ts          # Data management
│   └── utils.ts         # Helper functions
└── public/              # Static assets
\`\`\`

## Usage

### For Administrators
1. Login with admin credentials
2. Navigate to "User Management" to approve new users
3. Use "Module Management" to create and edit learning content
4. Monitor student progress in the analytics section

### For Students
1. Register for a new account (requires admin approval)
2. Once approved, login and access learning modules
3. Complete assessments to track progress
4. Download certificates upon module completion

## Deployment

This LMS is optimized for deployment on Vercel. See deployment guide for details.

## Customization

- **Styling:** Modify `tailwind.config.ts` and component styles
- **Content:** Add learning modules through the admin interface
- **Branding:** Update logos and colors in the components
- **Features:** Extend functionality by adding new components

## Support

For issues or questions, please check the console logs and ensure all dependencies are properly installed.

## License

MIT License - feel free to use this project for educational or commercial purposes.
