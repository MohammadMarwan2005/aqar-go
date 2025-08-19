import 'package:aqar_go/presentation/feature/create_update_post/cubit/create_update_post_args.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/feature/my_properties/cubit/my_properties_cubit.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:aqar_go/presentation/widgets/ad_primary_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/property.dart';
import '../../widgets/error_message.dart';
import '../../widgets/green_red_chip.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/screen_horizontal_padding.dart';
import '../paging_base/cubit/paging_cubit.dart';
import '../paging_base/paged_list_view.dart';

class MyPropertiesScreen extends StatelessWidget {
  const MyPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Properties".tr(context))),
      body: SafeArea(
        child: ScreenPadding(
          // child: BlocBuilder<MyPropertiesCubit, MyPropertiesState>(
          //   builder: (context, state) {
          //     return state.when(
          //       loading: () {
          //         return LoadingScreen();
          //       },
          //       error: (domainError) {
          //         return ErrorMessage(
          //           error: domainError,
          //           onTryAgain: () {
          //             context.read<MyPropertiesCubit>().fetchMyProperties();
          //           },
          //         );
          //       },
          //       success: (properties) {
          //         return RefreshIndicator(
          //           onRefresh: () async {
          //             context.read<MyPropertiesCubit>().fetchMyProperties();
          //           },
          //           child:
          //               (properties.isEmpty)
          //                   ? Center(
          //                     child: Text("No Properties Found!".tr(context)),
          //                   )
          //                   : ListView.builder(
          //                     itemCount: properties.length,
          //                     itemBuilder: (context, index) {
          //                       return Padding(
          //                         padding: const EdgeInsets.symmetric(
          //                           vertical: 8.0,
          //                         ),
          //                         child: PropertyCard(
          //                           property: properties[index],
          //                           onTap: () {
          //                             context.pushRoute(
          //                               Routes.createUpdatePost,
          //                               extra: CreateUpdatePostArgs(
          //                                 property: properties[index],
          //                                 myPropertiesCubit:
          //                                     context.read<MyPropertiesCubit>(),
          //                               ),
          //                             );
          //                           },
          //                         ),
          //                       );
          //                     },
          //                   ),
          //         );
          //       },
          //     );
          //   },
          // ),
          child: BlocBuilder<MyPropertiesCubit, PagingState<Property>>(
            builder: (context, state) {
              return PagedListView(
                scrollDirection: Axis.vertical,
                state: state,
                itemBuilder: (property) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: PropertyCard(
                      property: property,
                      onTap: () {
                        context.pushRoute(
                          Routes.createUpdatePost,
                          extra: CreateUpdatePostArgs(
                            property: property,
                            myPropertiesCubit:
                                context.read<MyPropertiesCubit>(),
                          ),
                        );
                      },
                    ),
                  );
                },
                fetchNextPage: () {
                  context.read<MyPropertiesCubit>().fetchNextPageItems();
                },
                onRefresh: () {
                  context.read<MyPropertiesCubit>().resetState();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final Property property;
  final Function() onTap;

  const PropertyCard({super.key, required this.property, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final imageUrl = property.images.firstOrNull?.imageUrl;

    return InkWell(
      overlayColor: WidgetStatePropertyAll(
        Theme.of(context).colorScheme.surface,
      ),
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child:
                      (imageUrl != null)
                          ? Image.network(imageUrl, fit: BoxFit.cover)
                          : Image.asset(
                            "assets/images/profile_image_placeholder.png",
                            fit: BoxFit.cover,
                          ),
                ),
                PositionedDirectional(
                  top: 4,
                  start: 4,
                  child: GreenRedChip(
                    goodText: "Published".tr(context),
                    badText: "Unpublished".tr(context),
                    good: property.isAd,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    property.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.square_foot, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('${property.area} m²'),
                      SizedBox(width: 16),
                      Icon(Icons.attach_money, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('${property.price}'),
                      Spacer(),
                      PropertableTypeChip(propertable: property.propertable),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
