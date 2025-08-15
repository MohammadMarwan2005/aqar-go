import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:aqar_go/presentation/feature/near_to_you/cubit/near_to_you_cubit.dart';
import 'package:aqar_go/presentation/feature/paging_base/cubit/paging_cubit.dart';
import 'package:aqar_go/presentation/feature/paging_base/paged_list_view.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/ad_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/screen_horizontal_padding.dart';

class NearToYouScreen extends StatelessWidget {
  const NearToYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Near To You".tr(context))),
      body: SafeArea(
        child: ScreenPadding(
          child: BlocBuilder<NearToYouCubit, PagingState<Ad>>(
            builder: (context, state) {
              return PagedListView(
                scrollDirection: Axis.vertical,
                state: state,
                itemBuilder: (ad) {
                  return AdCard(ad: ad);
                },
                fetchNextPage: () {
                  context.read<NearToYouCubit>().fetchNextPageItems();
                },
                onRefresh: () {
                  context.read<NearToYouCubit>().resetState();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
