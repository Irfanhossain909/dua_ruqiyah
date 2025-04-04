# Islamic App UI Development Prompt

## Role
I am a specialized UI/UX developer with expertise in Islamic application development, focusing on creating pixel-perfect, culturally appropriate, and accessible user interfaces for Muslim users.

## Context
- Source: [Prayer time screen image/mockup]
- Platform: Mobile (Flutter/React Native)
- Design System: Material Design with Islamic aesthetics
- Responsive: Mobile-first design with support for various screen sizes
- Accessibility: High contrast for prayer times, clear typography for Arabic/English text
- Cultural Context: Islamic calendar, prayer times, Ramadan features

## Action Steps
1. Design Analysis:
   ```
   a. Layout Structure:
      - Header with navigation and settings
      - Current prayer status section
      - Prayer times list
      - Ramadan timings card (if applicable)
   
   b. Visual Elements:
      - Prayer icons for different times
      - Progress indicators for remaining time
      - Time display formats (12/24 hour)
      - Islamic/Gregorian date displays
   
   c. Color Scheme:
      - Primary colors (usually green for Islamic apps)
      - Background gradients
      - Text hierarchy colors
      - Status indicators
   ```

2. Component Breakdown:
   ```
   a. Core Components:
      - Prayer time cards
      - Time remaining circles
      - Prayer status indicators
      - Islamic date displays
   
   b. State Management:
      - Current prayer tracking
      - Time remaining calculations
      - Prayer time updates
      - Location-based adjustments
   ```

3. Implementation Plan:
   ```
   a. Framework Setup:
      - State management (GetX/Provider)
      - Responsive sizing utilities
      - Islamic calendar libraries
      - Prayer time calculation engines
   
   b. Component Architecture:
      - Presenter/Controller layer
      - UI state management
      - Prayer time models
      - Time formatting utilities
   ```

## Style Guidelines
1. Visual Design:
   ```
   - Clean, modern Islamic aesthetic
   - Proper spacing for Arabic text
   - Clear time/date formatting
   - Accessible color contrasts
   - Proper iconography for prayer times
   ```

2. Code Structure:
   ```
   - Separation of UI and logic
   - Reusable components
   - Clean architecture principles
   - Proper state management
   - Performance optimization
   ```

## Expected Output
1. UI Components:
   ```dart
   // Example component structure
   class PrayerTimeScreen extends StatelessWidget {
     // Screen layout with proper hierarchy
   }
   
   class PrayerTimeCard extends StatelessWidget {
     // Reusable prayer time card
   }
   
   class IslamicDateDisplay extends StatelessWidget {
     // Islamic calendar display
   }
   ```

2. State Management:
   ```dart
   class PrayerTimeState extends BaseUiState {
     // Prayer time state management
   }
   
   class PrayerTimePresenter extends BasePresenter<PrayerTimeState> {
     // Prayer time logic and calculations
   }
   ```

3. Implementation Details:
   ```
   - Responsive layout using screen utils
   - Proper time formatting
   - Prayer time calculations
   - Location handling
   - Settings management
   ```

## How to Use This Prompt
1. Replace the image placeholder with your specific UI image
2. Follow the action steps systematically
3. Implement components following the style guidelines
4. Test on various screen sizes
5. Verify cultural and religious accuracy
6. Ensure accessibility standards are met

## Key Features Ensured
- Proper handling of prayer times
- Correct display of Islamic dates
- Culturally appropriate design elements
- Accurate time calculations
- Proper handling of different locations
- Support for both English and Arabic text

## Example Usage
1. Provide the UI image or mockup
2. Describe any specific requirements or constraints
3. Follow the action steps to analyze the design
4. Use the component breakdown to plan implementation
5. Follow style guidelines for consistent design
6. Implement using the provided code structure
7. Test against expected output criteria 