class AppStrings {
  AppStrings._();

  // ==========================================
  // 1. GENERAL / ONBOARDING
  // ==========================================
  static const getStarted = "Get Started";

  // ==========================================
  // 2. AUTHENTICATION (TITLES & SSO)
  // ==========================================

  /// Sign In
  static const signInTitle = "Login to your account";
  static const signInSubtitle = "It’s great to see you again.";
  static const signInSwitcherLabel = "Don't have an account?";
  static const signInSwitcherBtnLabel = "Join Us";
  static const signInSubmitBtn = "Login";

  /// Sign Up
  static const signUpTitle = "Create an account";
  static const signUpSubtitle = "Let’s create your account.";
  static const signUpSwitcherLabel = "Already have an account?";
  static const signUpSwitcherBtnLabel = "Login";
  static const signUpSubmitBtn = "Create Account";

  /// SSO Buttons
  static const continueWithGoogle = "Continue with Google";
  static const continueWithFacebook = "Continue with Facebook";

  // ==========================================
  // 3. FORM KEYS
  // ==========================================
  static const fieldEmail = "email";
  static const fieldPassword = "password";
  static const fieldFullName = "fullname";

  // ==========================================
  // 4. FORM FIELDS & LABELS
  // ==========================================

  /// Common
  static const emailLabel = "Email";
  static const emailHint = "eg. test@example.com";

  /// Sign In Specific
  static const loginPasswordLabel = "Password";
  static const loginPasswordHint = "Enter your password";

  /// Sign Up Specific
  static const fullNameLabel = "Full Name";
  static const fullNameHint = "eg. John Doe";
  static const createPasswordLabel = "Create Password";
  static const createPasswordHint = "Create strong password";

  // ==========================================
  // 5. VALIDATION MESSAGES
  // ==========================================

  /// Email
  static const emailRequiredErr = "Email is required";
  static const emailInvalidErr = "Please enter valid email address";

  /// Full Name
  static const fullNameRequiredErr = "Full Name is required";
  static const fullNameLengthErr = "Your name must be more than this";

  /// Password
  static const passwordRequired = "Password is required";
  static const passwordLength = "Password must be at least 8 characters";
  static const strongPassword =
      "- Password must be at least 8 characters\n"
      "- include an uppercase letter\n"
      "- include a number\n"
      "- include a symbol";

  // ==========================================
  // 6. RICH TEXT & TAGS
  // ==========================================
  static const forgetPasswordText =
      'Forget your password? <link tag="reset">Reset</link>';
  static const termsAndConditionsText =
      'By signing up you agree to our <link tag="terms">Terms</link>, <link tag="policy">Privacy Policy</link> and <link tag="cookie">Cookie Use</link>.';

  /// Tags
  static const tagLink = "link";
  static const tagReset = "reset";
  static const tagTerms = "terms";
  static const tagPolicy = "policy";
  static const tagCookie = "cookie";
}
