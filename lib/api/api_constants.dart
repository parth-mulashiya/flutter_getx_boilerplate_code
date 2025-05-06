class ApiConstants {
  static const googleMapKey = "AIzaSyC0FNiiwO6mX9LOereEpxYZiTn5YtS8FRc";
  // static const baseUrl = 'http://surefy.whatnearbyme.com:5000/';
  // static const baseUrl = 'https://api.surefy.co/';
  // static const baseUrl = 'https://api.k8s.surefy.co/';
  static const baseUrl = 'https://api.dev.surefy.co/';
  // static const baseUrl = 'https://api.surefy.co/';
  static const loginApi = 'auth/v1/login';
  static const resendOtp = '/auth/v1/resend/';
  static const verifyOtp = '/auth/v1/verify/';
  static const registrationApi = 'auth/v1/registration';

  static const contactApi = 'contact/v1/sync';
  static const lastContactSyncApi = 'contact/v1/last-sync';
  static const getContactApi = 'contact/v1';

  static const callLogsApi = 'call-log/v1/sync';
  static const lastcallLogsSyncApi = 'call-log/v1/last-sync';

  static const messageApi = 'sms-log/v1/sync';
  static const lastMessageSyncApi = 'sms-log/v1/last-sync';

  static const deviceDetailApi = 'device/v1/save';

  static const addSimDataApi = 'device/v1/sim/';
  static const getVerifiedNameApi = 'profile/v1/name';

  static const aadhaarVerificationApi = 'verification/v1/ekyc';

  //LMS
  static const leadApi = 'lms/v1/lead';
  static const leadDetailApi = 'lms/v1/lead/app';
  static const templatesApi = 'lms/v1/templates';
  static const campaignApi = 'lms/v1/campaign';
  static const campaignAppApi = 'lms/v1/campaign/app';
  static const formApi = 'lms/v1/form';

  static const getSampleFileUrlApi = 'lms/v1/lead-sample/';
  static const uploadFIleApi = 'lms/v1/lead/bulk-upload';
  static const staffApi = 'lms/v1/staff';
  static const groupsApi = 'lms/v1/groups';
  static const activitiesCountApi = 'lms/v1/analytics/count';
  static const businessApi = 'business/v1/business/nearby';
  static const businessCategoryApi = 'business/v1/category';
  static const getProductCategoryApi = 'lms/v1/product-category';
  static const getProductApi = 'lms/v1/product/all';
  static const getProductDetailApi = 'lms/v1/product';

  static const sendOcr = 'lms/v1/ocr';
  static const sendMailOcr = 'lms/v1/ocr/send-mail';

  static const emailLoginApi = 'lms/v1/auth/login';
  static const emailOtpApi = 'lms/v1/auth/verify-otp';

  static const getSubscriptionDetailApi = 'lms/v1/subscription';
  static const getActiveSubscriptionApi = 'lms/v1/subscription/active';
  static const upgradeSubscriptionApi = 'lms/v1/payment/upgrade-subscription';

  static const getAdBannerApi = 'lms/v1/advertise-banner';

  // static const hashGenerateApi = 'subscription/v1/';

  static const subscriptionPaymentDetailsApi =
      'lms/v1/payment/generate-payment-details';
  static const hashGenerateApi = 'lms/v1/payment/generate-payment-hash-mobile';
  static const lmsUserApi = 'lms/v1/user';
  static const cancelSubscriptionApi = 'lms/v1/payment/cancel-subscription';

  static const feedbackQuestionApi = 'lms/v1/questions';
  static const feedbackAnsApi = 'lms/v1/feedback/bulk';
  static const callHistoryApi = 'lms/v1/call-history';
  static const shortcutApi = 'lms/v1/shortcut';
  static const productLeadApi = 'lms/v1/lead/product';
  static const productLeadFormApi = 'lms/v1/lead/lead';
}
