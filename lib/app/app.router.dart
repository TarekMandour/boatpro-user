// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/models/provider.dart' as _i37;
import 'package:example/models/reservation_details.dart' as _i38;
import 'package:example/ui/index.dart' as _i36;
import 'package:example/ui/views/book_yacht/book_yacht_view.dart' as _i30;
import 'package:example/ui/views/bottom_nav_bar/bottom_nav_bar_view.dart'
    as _i12;
import 'package:example/ui/views/change_password/change_password_view.dart'
    as _i10;
import 'package:example/ui/views/chats/chats_view.dart' as _i15;
import 'package:example/ui/views/confirm_reservation/confirm_reservation_view.dart'
    as _i31;
import 'package:example/ui/views/congratulations/congratulations_view.dart'
    as _i9;
import 'package:example/ui/views/contactus/contactus_view.dart' as _i17;
import 'package:example/ui/views/conversation/conversation_view.dart' as _i24;
import 'package:example/ui/views/create_account/create_account_view.dart'
    as _i8;
import 'package:example/ui/views/details/details_view.dart' as _i28;
import 'package:example/ui/views/edit_account/edit_account_view.dart' as _i23;
import 'package:example/ui/views/faq/faq_view.dart' as _i22;
import 'package:example/ui/views/forget_password/forget_password_view.dart'
    as _i11;
import 'package:example/ui/views/home/home_view.dart' as _i2;
import 'package:example/ui/views/intro/intro_view.dart' as _i4;
import 'package:example/ui/views/login/login_view.dart' as _i5;
import 'package:example/ui/views/map/map_view.dart' as _i32;
import 'package:example/ui/views/notifications/notifications_view.dart' as _i19;
import 'package:example/ui/views/otp/otp_view.dart' as _i7;
import 'package:example/ui/views/pages/pages_view.dart' as _i18;
import 'package:example/ui/views/pay/pay_view.dart' as _i33;
import 'package:example/ui/views/profile/profile_view.dart' as _i13;
import 'package:example/ui/views/provider_details/provider_details_view.dart'
    as _i26;
import 'package:example/ui/views/providers/providers_view.dart' as _i25;
import 'package:example/ui/views/register/register_view.dart' as _i6;
import 'package:example/ui/views/reservation_details/reservation_details_view.dart'
    as _i29;
import 'package:example/ui/views/reservations/reservations_view.dart' as _i14;
import 'package:example/ui/views/reviews/reviews_view.dart' as _i21;
import 'package:example/ui/views/saved/saved_view.dart' as _i20;
import 'package:example/ui/views/settings/settings_view.dart' as _i16;
import 'package:example/ui/views/startup/startup_view.dart' as _i3;
import 'package:example/ui/views/top_yachts/top_yachts_view.dart' as _i27;
import 'package:example/ui/views/yachts/yachts_view.dart' as _i34;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i35;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i39;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const introView = '/intro-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const otpView = '/otp-view';

  static const createAccountView = '/create-account-view';

  static const congratulationsView = '/congratulations-view';

  static const changePasswordView = '/change-password-view';

  static const forgetPasswordView = '/forget-password-view';

  static const bottomNavBarView = '/bottom-nav-bar-view';

  static const profileView = '/profile-view';

  static const reservationsView = '/reservations-view';

  static const chatsView = '/chats-view';

  static const settingsView = '/settings-view';

  static const contactusView = '/contactus-view';

  static const pagesView = '/pages-view';

  static const notificationsView = '/notifications-view';

  static const savedView = '/saved-view';

  static const reviewsView = '/reviews-view';

  static const faqView = '/faq-view';

  static const editAccountView = '/edit-account-view';

  static const conversationView = '/conversation-view';

  static const providersView = '/providers-view';

  static const providerDetailsView = '/provider-details-view';

  static const topYachtsView = '/top-yachts-view';

  static const detailsView = '/details-view';

  static const reservationDetailsView = '/reservation-details-view';

  static const bookYachtView = '/book-yacht-view';

  static const confirmReservationView = '/confirm-reservation-view';

  static const mapView = '/map-view';

  static const payView = '/pay-view';

  static const yachtsView = '/yachts-view';

  static const all = <String>{
    homeView,
    startupView,
    introView,
    loginView,
    registerView,
    otpView,
    createAccountView,
    congratulationsView,
    changePasswordView,
    forgetPasswordView,
    bottomNavBarView,
    profileView,
    reservationsView,
    chatsView,
    settingsView,
    contactusView,
    pagesView,
    notificationsView,
    savedView,
    reviewsView,
    faqView,
    editAccountView,
    conversationView,
    providersView,
    providerDetailsView,
    topYachtsView,
    detailsView,
    reservationDetailsView,
    bookYachtView,
    confirmReservationView,
    mapView,
    payView,
    yachtsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.introView,
      page: _i4.IntroView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i6.RegisterView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i7.OtpView,
    ),
    _i1.RouteDef(
      Routes.createAccountView,
      page: _i8.CreateAccountView,
    ),
    _i1.RouteDef(
      Routes.congratulationsView,
      page: _i9.CongratulationsView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i10.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.forgetPasswordView,
      page: _i11.ForgetPasswordView,
    ),
    _i1.RouteDef(
      Routes.bottomNavBarView,
      page: _i12.BottomNavBarView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i13.ProfileView,
    ),
    _i1.RouteDef(
      Routes.reservationsView,
      page: _i14.ReservationsView,
    ),
    _i1.RouteDef(
      Routes.chatsView,
      page: _i15.ChatsView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i16.SettingsView,
    ),
    _i1.RouteDef(
      Routes.contactusView,
      page: _i17.ContactusView,
    ),
    _i1.RouteDef(
      Routes.pagesView,
      page: _i18.PagesView,
    ),
    _i1.RouteDef(
      Routes.notificationsView,
      page: _i19.NotificationsView,
    ),
    _i1.RouteDef(
      Routes.savedView,
      page: _i20.SavedView,
    ),
    _i1.RouteDef(
      Routes.reviewsView,
      page: _i21.ReviewsView,
    ),
    _i1.RouteDef(
      Routes.faqView,
      page: _i22.FaqView,
    ),
    _i1.RouteDef(
      Routes.editAccountView,
      page: _i23.EditAccountView,
    ),
    _i1.RouteDef(
      Routes.conversationView,
      page: _i24.ConversationView,
    ),
    _i1.RouteDef(
      Routes.providersView,
      page: _i25.ProvidersView,
    ),
    _i1.RouteDef(
      Routes.providerDetailsView,
      page: _i26.ProviderDetailsView,
    ),
    _i1.RouteDef(
      Routes.topYachtsView,
      page: _i27.TopYachtsView,
    ),
    _i1.RouteDef(
      Routes.detailsView,
      page: _i28.DetailsView,
    ),
    _i1.RouteDef(
      Routes.reservationDetailsView,
      page: _i29.ReservationDetailsView,
    ),
    _i1.RouteDef(
      Routes.bookYachtView,
      page: _i30.BookYachtView,
    ),
    _i1.RouteDef(
      Routes.confirmReservationView,
      page: _i31.ConfirmReservationView,
    ),
    _i1.RouteDef(
      Routes.mapView,
      page: _i32.MapView,
    ),
    _i1.RouteDef(
      Routes.payView,
      page: _i33.PayView,
    ),
    _i1.RouteDef(
      Routes.yachtsView,
      page: _i34.YachtsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.IntroView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.IntroView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.RegisterView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.RegisterView(),
        settings: data,
      );
    },
    _i7.OtpView: (data) {
      final args = data.getArgs<OtpViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.OtpView(
            key: args.key,
            isChangePassword: args.isChangePassword,
            phone: args.phone,
            email: args.email),
        settings: data,
      );
    },
    _i8.CreateAccountView: (data) {
      final args = data.getArgs<CreateAccountViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.CreateAccountView(key: args.key, phone: args.phone, email: args.email),
        settings: data,
      );
    },
    _i9.CongratulationsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.CongratulationsView(),
        settings: data,
      );
    },
    _i10.ChangePasswordView: (data) {
      final args = data.getArgs<ChangePasswordViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.ChangePasswordView(key: args.key, phone: args.phone),
        settings: data,
      );
    },
    _i11.ForgetPasswordView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ForgetPasswordView(),
        settings: data,
      );
    },
    _i12.BottomNavBarView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.BottomNavBarView(),
        settings: data,
      );
    },
    _i13.ProfileView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.ProfileView(),
        settings: data,
      );
    },
    _i14.ReservationsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ReservationsView(),
        settings: data,
      );
    },
    _i15.ChatsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.ChatsView(),
        settings: data,
      );
    },
    _i16.SettingsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.SettingsView(),
        settings: data,
      );
    },
    _i17.ContactusView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.ContactusView(),
        settings: data,
      );
    },
    _i18.PagesView: (data) {
      final args = data.getArgs<PagesViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i18.PagesView(key: args.key, title: args.title, body: args.body),
        settings: data,
      );
    },
    _i19.NotificationsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.NotificationsView(),
        settings: data,
      );
    },
    _i20.SavedView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.SavedView(),
        settings: data,
      );
    },
    _i21.ReviewsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.ReviewsView(),
        settings: data,
      );
    },
    _i22.FaqView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.FaqView(),
        settings: data,
      );
    },
    _i23.EditAccountView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.EditAccountView(),
        settings: data,
      );
    },
    _i24.ConversationView: (data) {
      final args = data.getArgs<ConversationViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i24.ConversationView(
            key: args.key,
            id: args.id,
            providerName: args.providerName,
            image: args.image),
        settings: data,
      );
    },
    _i25.ProvidersView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.ProvidersView(),
        settings: data,
      );
    },
    _i26.ProviderDetailsView: (data) {
      final args = data.getArgs<ProviderDetailsViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i26.ProviderDetailsView(key: args.key, data: args.data),
        settings: data,
      );
    },
    _i27.TopYachtsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.TopYachtsView(),
        settings: data,
      );
    },
    _i28.DetailsView: (data) {
      final args = data.getArgs<DetailsViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i28.DetailsView(key: args.key, data: args.data),
        settings: data,
      );
    },
    _i29.ReservationDetailsView: (data) {
      final args = data.getArgs<ReservationDetailsViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i29.ReservationDetailsView(
            key: args.key, reReserve: args.reReserve, yachtId: args.yachtId),
        settings: data,
      );
    },
    _i30.BookYachtView: (data) {
      final args = data.getArgs<BookYachtViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i30.BookYachtView(
            key: args.key, yachtId: args.yachtId, isUpdate: args.isUpdate),
        settings: data,
      );
    },
    _i31.ConfirmReservationView: (data) {
      final args = data.getArgs<ConfirmReservationViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i31.ConfirmReservationView(key: args.key, data: args.data),
        settings: data,
      );
    },
    _i32.MapView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i32.MapView(),
        settings: data,
      );
    },
    _i33.PayView: (data) {
      final args = data.getArgs<PayViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i33.PayView(key: args.key, url: args.url),
        settings: data,
      );
    },
    _i34.YachtsView: (data) {
      final args = data.getArgs<YachtsViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i34.YachtsView(
            key: args.key,
            countryId: args.countryId,
            serviceId: args.serviceId),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class OtpViewArguments {
  const OtpViewArguments({
    this.key,
    required this.isChangePassword,
    required this.phone,
    required this.email,
  });

  final _i36.Key? key;

  final bool isChangePassword;

  final String phone;
  final String email;

  @override
  String toString() {
    return '{"key": "$key", "isChangePassword": "$isChangePassword", "phone": "$phone", "email": "$email"}';
  }

  @override
  bool operator ==(covariant OtpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.isChangePassword == isChangePassword &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isChangePassword.hashCode ^ phone.hashCode;
  }
}

class CreateAccountViewArguments {
  const CreateAccountViewArguments({
    this.key,
    required this.phone,
    required this.email,
  });

  final _i36.Key? key;

  final String phone;
  final String email;

  @override
  String toString() {
    return '{"key": "$key", "phone": "$phone", "email": "$email"}';
  }

  @override
  bool operator ==(covariant CreateAccountViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.phone == phone && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ phone.hashCode;
  }
}

class ChangePasswordViewArguments {
  const ChangePasswordViewArguments({
    this.key,
    required this.phone,
  });

  final _i36.Key? key;

  final String phone;

  @override
  String toString() {
    return '{"key": "$key", "phone": "$phone"}';
  }

  @override
  bool operator ==(covariant ChangePasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.phone == phone;
  }

  @override
  int get hashCode {
    return key.hashCode ^ phone.hashCode;
  }
}

class PagesViewArguments {
  const PagesViewArguments({
    this.key,
    required this.title,
    required this.body,
  });

  final _i36.Key? key;

  final String title;

  final String body;

  @override
  String toString() {
    return '{"key": "$key", "title": "$title", "body": "$body"}';
  }

  @override
  bool operator ==(covariant PagesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.title == title && other.body == body;
  }

  @override
  int get hashCode {
    return key.hashCode ^ title.hashCode ^ body.hashCode;
  }
}

class ConversationViewArguments {
  const ConversationViewArguments({
    this.key,
    required this.id,
    required this.providerName,
    required this.image,
  });

  final _i36.Key? key;

  final String id;

  final String providerName;

  final String image;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "providerName": "$providerName", "image": "$image"}';
  }

  @override
  bool operator ==(covariant ConversationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.id == id &&
        other.providerName == providerName &&
        other.image == image;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode ^ providerName.hashCode ^ image.hashCode;
  }
}

class ProviderDetailsViewArguments {
  const ProviderDetailsViewArguments({
    this.key,
    required this.data,
  });

  final _i36.Key? key;

  final _i37.ProviderModel data;

  @override
  String toString() {
    return '{"key": "$key", "data": "$data"}';
  }

  @override
  bool operator ==(covariant ProviderDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ data.hashCode;
  }
}

class DetailsViewArguments {
  const DetailsViewArguments({
    this.key,
    required this.data,
  });

  final _i36.Key? key;

  final _i36.YachtModel data;

  @override
  String toString() {
    return '{"key": "$key", "data": "$data"}';
  }

  @override
  bool operator ==(covariant DetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ data.hashCode;
  }
}

class ReservationDetailsViewArguments {
  const ReservationDetailsViewArguments({
    this.key,
    required this.reReserve,
    required this.yachtId,
  });

  final _i36.Key? key;

  final bool reReserve;

  final String yachtId;

  @override
  String toString() {
    return '{"key": "$key", "reReserve": "$reReserve", "yachtId": "$yachtId"}';
  }

  @override
  bool operator ==(covariant ReservationDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.reReserve == reReserve &&
        other.yachtId == yachtId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ reReserve.hashCode ^ yachtId.hashCode;
  }
}

class BookYachtViewArguments {
  const BookYachtViewArguments({
    this.key,
    required this.yachtId,
    this.isUpdate = false,
  });

  final _i36.Key? key;

  final String yachtId;

  final bool isUpdate;

  @override
  String toString() {
    return '{"key": "$key", "yachtId": "$yachtId", "isUpdate": "$isUpdate"}';
  }

  @override
  bool operator ==(covariant BookYachtViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.yachtId == yachtId &&
        other.isUpdate == isUpdate;
  }

  @override
  int get hashCode {
    return key.hashCode ^ yachtId.hashCode ^ isUpdate.hashCode;
  }
}

class ConfirmReservationViewArguments {
  const ConfirmReservationViewArguments({
    this.key,
    required this.data,
  });

  final _i36.Key? key;

  final _i38.ReservationDetailsModel data;

  @override
  String toString() {
    return '{"key": "$key", "data": "$data"}';
  }

  @override
  bool operator ==(covariant ConfirmReservationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ data.hashCode;
  }
}

class PayViewArguments {
  const PayViewArguments({
    this.key,
    required this.url,
  });

  final _i36.Key? key;

  final String url;

  @override
  String toString() {
    return '{"key": "$key", "url": "$url"}';
  }

  @override
  bool operator ==(covariant PayViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.url == url;
  }

  @override
  int get hashCode {
    return key.hashCode ^ url.hashCode;
  }
}

class YachtsViewArguments {
  const YachtsViewArguments({
    this.key,
    required this.countryId,
    required this.serviceId,
  });

  final _i36.Key? key;

  final String countryId;

  final String serviceId;

  @override
  String toString() {
    return '{"key": "$key", "countryId": "$countryId", "serviceId": "$serviceId"}';
  }

  @override
  bool operator ==(covariant YachtsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.countryId == countryId &&
        other.serviceId == serviceId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ countryId.hashCode ^ serviceId.hashCode;
  }
}

extension NavigatorStateExtension on _i39.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToIntroView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.introView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView({
    _i36.Key? key,
    required bool isChangePassword,
    required String phone,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(
            key: key, isChangePassword: isChangePassword, phone: phone, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountView({
    _i36.Key? key,
    required String phone,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createAccountView,
        arguments: CreateAccountViewArguments(key: key, phone: phone, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCongratulationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.congratulationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView({
    _i36.Key? key,
    required String phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        arguments: ChangePasswordViewArguments(key: key, phone: phone),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNavBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReservationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reservationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactusView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactusView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPagesView({
    _i36.Key? key,
    required String title,
    required String body,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pagesView,
        arguments: PagesViewArguments(key: key, title: title, body: body),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSavedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.savedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReviewsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reviewsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFaqView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.faqView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConversationView({
    _i36.Key? key,
    required String id,
    required String providerName,
    required String image,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.conversationView,
        arguments: ConversationViewArguments(
            key: key, id: id, providerName: providerName, image: image),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProvidersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.providersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProviderDetailsView({
    _i36.Key? key,
    required _i37.ProviderModel data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.providerDetailsView,
        arguments: ProviderDetailsViewArguments(key: key, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTopYachtsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.topYachtsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailsView({
    _i36.Key? key,
    required _i36.YachtModel data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.detailsView,
        arguments: DetailsViewArguments(key: key, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReservationDetailsView({
    _i36.Key? key,
    required bool reReserve,
    required String yachtId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.reservationDetailsView,
        arguments: ReservationDetailsViewArguments(
            key: key, reReserve: reReserve, yachtId: yachtId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBookYachtView({
    _i36.Key? key,
    required String yachtId,
    bool isUpdate = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bookYachtView,
        arguments: BookYachtViewArguments(
            key: key, yachtId: yachtId, isUpdate: isUpdate),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmReservationView({
    _i36.Key? key,
    required _i38.ReservationDetailsModel data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.confirmReservationView,
        arguments: ConfirmReservationViewArguments(key: key, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPayView({
    _i36.Key? key,
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.payView,
        arguments: PayViewArguments(key: key, url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToYachtsView({
    _i36.Key? key,
    required String countryId,
    required String serviceId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.yachtsView,
        arguments: YachtsViewArguments(
            key: key, countryId: countryId, serviceId: serviceId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithIntroView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.introView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView({
    _i36.Key? key,
    required bool isChangePassword,
    required String phone,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(
            key: key, isChangePassword: isChangePassword, phone: phone, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateAccountView({
    _i36.Key? key,
    required String phone,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createAccountView,
        arguments: CreateAccountViewArguments(key: key, phone: phone, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCongratulationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.congratulationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView({
    _i36.Key? key,
    required String phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        arguments: ChangePasswordViewArguments(key: key, phone: phone),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomNavBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReservationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reservationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactusView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contactusView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPagesView({
    _i36.Key? key,
    required String title,
    required String body,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.pagesView,
        arguments: PagesViewArguments(key: key, title: title, body: body),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSavedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.savedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReviewsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reviewsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFaqView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.faqView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConversationView({
    _i36.Key? key,
    required String id,
    required String providerName,
    required String image,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.conversationView,
        arguments: ConversationViewArguments(
            key: key, id: id, providerName: providerName, image: image),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProvidersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.providersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProviderDetailsView({
    _i36.Key? key,
    required _i37.ProviderModel data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.providerDetailsView,
        arguments: ProviderDetailsViewArguments(key: key, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTopYachtsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.topYachtsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailsView({
    _i36.Key? key,
    required _i36.YachtModel data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.detailsView,
        arguments: DetailsViewArguments(key: key, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReservationDetailsView({
    _i36.Key? key,
    required bool reReserve,
    required String yachtId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.reservationDetailsView,
        arguments: ReservationDetailsViewArguments(
            key: key, reReserve: reReserve, yachtId: yachtId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBookYachtView({
    _i36.Key? key,
    required String yachtId,
    bool isUpdate = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bookYachtView,
        arguments: BookYachtViewArguments(
            key: key, yachtId: yachtId, isUpdate: isUpdate),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmReservationView({
    _i36.Key? key,
    required _i38.ReservationDetailsModel data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.confirmReservationView,
        arguments: ConfirmReservationViewArguments(key: key, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPayView({
    _i36.Key? key,
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.payView,
        arguments: PayViewArguments(key: key, url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithYachtsView({
    _i36.Key? key,
    required String countryId,
    required String serviceId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.yachtsView,
        arguments: YachtsViewArguments(
            key: key, countryId: countryId, serviceId: serviceId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
