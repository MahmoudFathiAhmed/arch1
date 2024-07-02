
import 'package:arch1/core/shared_widgets/empty_error_widget.dart';
import 'package:arch1/core/utils/custom_types.dart';
import 'package:arch1/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';

class PaginatedListView<T> extends StatefulWidget {
  final PagingController<int, T> pagingController;
  final WidgetItemBuilder<T> itemBuilder;
  final ViewOrientation viewOrientation;
  final double cellAspectRatio;
  final double cellWidth;
  final Widget? emptyViewIconData;
  final String? emptyViewTitle;
  final String? emptyViewDescription;
  final String? emptyViewButtonTxt;
  final ValueGetter<Future<bool>>? emptyViewButtonClickListener;

  const PaginatedListView(
      {required this.pagingController,
        required this.itemBuilder,
        this.viewOrientation = ViewOrientation.orientationVertical,
        this.cellAspectRatio = 1,
        this.cellWidth = 200,
        this.emptyViewIconData,
        this.emptyViewTitle,
        this.emptyViewDescription,
        this.emptyViewButtonTxt,
        this.emptyViewButtonClickListener,
        Key? key})
      : super(key: key);

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  late PagingController<int, T> _pagingController;

  @override
  void initState() {
    _pagingController = widget.pagingController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cellHeight = widget.cellWidth / widget.cellAspectRatio;

    var pagedChildBuilderDelegate = PagedChildBuilderDelegate<T>(
      itemBuilder: (context, item, index) =>
          _itemBuilder(item, index, cellHeight),
      firstPageErrorIndicatorBuilder: (_) => _buildErrorView(),
      firstPageProgressIndicatorBuilder: (_) => _buildLoadingView(),
      noItemsFoundIndicatorBuilder: (_) => _buildEmptyView(),
      newPageProgressIndicatorBuilder: (_) => Container(),
      newPageErrorIndicatorBuilder: (_) => Container(),
    );
    return widget.viewOrientation == ViewOrientation.orientationGrid
        ? PagedGridView<int, T>(
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        pagingController: _pagingController,
        builderDelegate: pagedChildBuilderDelegate,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.h,
          mainAxisSpacing: 5.h,
          childAspectRatio: widget.cellAspectRatio,
        ))
        : SizedBox(
      height:
      widget.viewOrientation == ViewOrientation.orientationHorizontal
          ? cellHeight
          : double.infinity,
      child: PagedListView<int, T>(
          scrollDirection: widget.viewOrientation ==
              ViewOrientation.orientationHorizontal
              ? Axis.horizontal
              : Axis.vertical,
          pagingController: _pagingController,
          builderDelegate: pagedChildBuilderDelegate),
    );
  }

  _itemBuilder(T item, int index, double cellHeight) {
    return widget.viewOrientation == ViewOrientation.orientationGrid
        ? widget.itemBuilder(item, index)
        : Container(
      width: widget.cellWidth,
      height: cellHeight,
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      child: widget.itemBuilder(item, index),
    );
  }

  _buildEmptyView() {
    return EmptyErrorWidget(
      icon: widget.emptyViewIconData,
      title: widget.emptyViewTitle,
      description: widget.emptyViewDescription ??
          'no result',
      hasButton: widget.emptyViewButtonTxt?.isNotEmpty == true,
      buttonTxt: widget.emptyViewButtonTxt,
      buttonClickListener: widget.emptyViewButtonClickListener,
    );
  }

  _buildErrorView() {
    if (_pagingController.error.errorCode == 0) {
      return Container();
    }
    return EmptyErrorWidget(
        description: _pagingController.error.errorMsg ??
            'something went wrong',);
  }

  _buildLoadingView() {
    var isGrid = widget.viewOrientation == ViewOrientation.orientationGrid;
    var cellWidth = isGrid ? ScreenUtil().screenWidth * 0.45 : widget.cellWidth;
    var cellHeight = cellWidth / widget.cellAspectRatio;
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: widget.viewOrientation == ViewOrientation.orientationHorizontal
            ? Row(
          children: [
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
          ],
        )
            : Column(
          children: [
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
            _buildLoadingRow(cellWidth, cellHeight, isGrid),
          ],
        ));
  }

  _buildLoadingRow(double cellWidth, double cellHeight, bool isGrid) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: isGrid
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.white,
            width: cellWidth,
            height: cellHeight,
          ),
          Container(
            color: Colors.white,
            width: cellWidth,
            height: cellHeight,
          ),
        ],
      )
          : Container(
        color: Colors.white,
        width: cellWidth,
        height: cellHeight,
      ),
    );
  }
}