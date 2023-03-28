const baseUrl = "http://10.0.2.2:90/";
// const baseUrl = "http://localhost:90/";
// const baseUrl = "http://192.168.137.61:90/";

const loginUrl = "patient/login";
const registerUrl = "patient/insert";
const getHealthCategoryUrl = "staff/healthCategory";
const getAppointmentHDT = "staff/appointment/dateAndtime/";
const getUserDetailsUrl = "patient/dashboard/get";
const bookAppointmentUrl = "patient/bookAppointment/get";
const getBookedAppointmentUrl = "patient/getBookedAppointment/get";
const deleteAppointmentTimeUrl = "staff/appointment/time/delete";
const updateAppointmentUrl = "patient/updateBookedAppointment/get/";
const deleteAppointmentUrl = "patient/deleteBookedAppointment/get/";

const getHealthCateogryIdUrl = "staff/get/healthCategoryId/";
const reAddAppointmentTimeUrl = "staff/appointment/time/add/";

const getDepartmentDoctor = "doctor/category/";
const bookDoctorAppointmentUrl = "patient/bookDoctorAppointment/get";
const getBookedDoctorAppointmentUrl = "patient/getBookedDoctorAppointment/get";
const deleteBookedDoctorAppointmentUrl =
    "patient/deleteBookedDoctorAppointment/get/";
const updateDoctorAppointmentUrl = "patient/updateBookedDoctorAppointment/get/";

const doctorLoginUrl = "doctor/login";

const updatePatientProfileUrl = "patient/update/get";

const doctorAppointmentStatusUrl = "doctor/getAppointment/";
const doctorAppointmentUpdateStatusUrl = "doctor/updateAppointmentStatus/";
const doctorGetProfile = "doctor/dashboard/single";
// const getProductUrl = "";
String? token;
