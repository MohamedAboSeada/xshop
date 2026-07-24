class AppStrings {
  AppStrings._();

  // ==========================================
  // 1. GENERAL / ONBOARDING / COMMON
  // ==========================================
  static const getStarted = "Get Started";
  static const continueBtn = "Continue";

  // ==========================================
  // 2. AUTHENTICATION (TITLES & SSO)
  // ==========================================

  /// Sign In
  static const signInTitle = "Welcome back";
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

  /// Forget Password
  static const forgotPasswordTitle = "Forgot password";
  static const forgotPasswordSubtitle =
      "Enter your email for the verification process. We will send 4 digits code to your email.";
  static const sendCodeBtn = "Send Code";

  /// Verification Code
  static const verificationCodeTitle = "Enter 4 Digit Code";
  static String verificationCodeSubtitle(String email) =>
      "Enter 4 digit code that your receive on your email ($email).";
  static const emailNotReceivedPrompt = "Code not received?";
  static const resendCodeBtn = "Resend code";

  /// Reset Password
  static const resetPasswordTitle = "Reset Password";
  static const resetPasswordSubtitle =
      "Set the new password for your account so you can login and access all the features.";

  /// Reset Success Dialog
  static const passwordChangedTitle = "Password Changed!";
  static const passwordChangedSubtitle =
      "Your can now use your new password to login to your account.";

  /// SSO Buttons
  static const continueWithGoogle = "Continue with Google";
  static const continueWithFacebook = "Continue with Facebook";

  // ==========================================
  // 3. FORM KEYS
  // ==========================================
  static const fieldEmail = "email";
  static const fieldPassword = "password";
  static const fieldFullName = "fullname";
  static const fieldConfirmPassword = "confirm";
  static const fieldOtp = "otp";

  // ==========================================
  // 4. FORM FIELDS & LABELS
  // ==========================================

  /// Common
  static const emailLabel = "Email";
  static const emailHint = "eg. test@example.com";

  /// Sign In Specific
  static const loginPasswordLabel = "Password";
  static const loginPasswordHint = "Enter your password";

  /// Sign Up & Reset Password Specific
  static const fullNameLabel = "Full Name";
  static const fullNameHint = "eg. John Doe";
  static const createPasswordLabel = "Create Password";
  static const createPasswordHint = "Create strong password";
  static const confirmPasswordLabel = "Confirm Password";
  static const confirmPasswordHint = "Type password again";

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

  // ==========================================
  // ACCOUNT
  // ==========================================
  static const account = 'Account';

  static const myOrders = 'My Orders';
  static const myDetails = 'My Details';
  static const addressBook = 'Address Book';
  static const paymentMethods = 'Payment Methods';
  static const notifications = 'Notifications';
  static const languages = 'Languages';
  static const faqs = 'FAQs';
  static const helpCenter = 'Help Center';
  static const logout = 'Logout';
  static const logoutTitle = "Log out?";
  static const logoutSubtitle =
      "Are you sure you want to log out of your account?";
  static const logoutConfirmBtn = "Yes, Logout";
  static const logoutCancelBtn = "No, Cancel";
}
