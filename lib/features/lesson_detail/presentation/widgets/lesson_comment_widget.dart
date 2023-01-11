import 'dart:developer' as logger;

import 'package:e_learning_app/bases/mobx/base_state.dart';
import 'package:e_learning_app/core/app/provider.dart';
import 'package:e_learning_app/features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../bases/presentation/atoms/link_text.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/styles.dart';
import '../../domain/entities/lesson_comment_model.dart';
import '../../domain/services/socket_service.dart';
import 'comment_on_lesson_text_field.dart';
import 'lesson_comment_item.dart';

class LessonCommentWidget extends StatefulWidget {
  const LessonCommentWidget({
    super.key,
    required this.lessonId,
  });

  final String lessonId;

  @override
  State<LessonCommentWidget> createState() => _LessonCommentWidgetState();
}

class _LessonCommentWidgetState extends State<LessonCommentWidget> {
  late LessonCommentsStore commentsStore;
  final socketService = GetIt.I<SocketServices>();
  bool isFirstPage = true;

  @override
  void initState() {
    super.initState();
    socketService.initialize(widget.lessonId);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    commentsStore = GetIt.I<LessonCommentsStore>();
    socketService.chatToClient(commentsStore);
  }

  @override
  void dispose() {
    socketService.leaveLesson(widget.lessonId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Observer(
        builder: (_) {
          if (commentsStore.state == BaseSate.init) {
            commentsStore.getLessonComments(widget.lessonId);
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.whiteColor,
              elevation: 0.6,
              centerTitle: false,
              title: LinkText(
                contentText1: "Comments\t\t",
                contentText2: commentsStore.comments == null
                    ? "0"
                    : "${commentsStore.comments!.length}",
                onTap1: () {},
                onTap2: () {},
                text1Style: AppStyles.headline6TextStyle.copyWith(
                  fontWeight: FontWeight.w900,
                ),
                text2Style: AppStyles.subtitle1TextStyle,
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  LessonCommentTextField(
                    onCommentSubmit: (submitValue) {
                      logger.log(submitValue);
                      socketService.chatToServer(
                        widget.lessonId,
                        LessonCommentModel(
                          id: "",
                          userId: GetIt.I<AppProvider>().user.id,
                          content: submitValue,
                          commentAt: DateTime.now(),
                          userName: GetIt.I<AppProvider>().user.name,
                          avatar: GetIt.I<AppProvider>().user.avatar,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: commentsStore.socketComments.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    primary: false,
                    itemBuilder: (context, index) => LessonCommentItem(
                      comment: commentsStore.socketComments[index],
                    ),
                  ),
                  commentsStore.state == BaseSate.loaded
                      ? ListView.builder(
                          itemCount: commentsStore.comments!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          primary: false,
                          itemBuilder: (context, index) => LessonCommentItem(
                            comment: commentsStore.comments![index],
                            // comment: LessonCommentModel(
                            //   id: "id",
                            //   userId: "userId",
                            //   // childCommentIds: const [],
                            //   // lessonId: "lessonId",
                            //   content: "comment",
                            //   commentAt:
                            //       RandomDate.withRange(2020, 2022).random(),
                            // ),
                            // // replyOnTab: onCommentTab,
                            // // haveReplies: Random().nextBool(),
                          ),
                        )
                      : Center(
                          child: commentsStore.state == BaseSate.loading
                              ? const CircularProgressIndicator()
                              : Text(commentsStore.errorMessage ?? "Error!"),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
/*
ListView.builder(
                    itemCount: 15,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    primary: false,
                    itemBuilder: (context, index) => LessonCommentItem(
                      comment: LessonCommentModel(
                        id: "id",
                        userId: "userId",
                        // childCommentIds: const [],
                        // lessonId: "lessonId",
                        content: "comment",
                        commentAt: RandomDate.withRange(2020, 2022).random(),
                      ),
                      // replyOnTab: onCommentTab,
                      // haveReplies: Random().nextBool(),
                    ),
                  ),
  Widget _buildPage() => PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        duration: const Duration(milliseconds: 500),
        reverse: isFirstPage,
        child: isFirstPage
            ? ParentCommentPage(
                onCommentTab: togglePage,
              )
            : DetailComment(
                onCommentTab: togglePage,
                comment: LessonCommentModel(
                  id: "id",
                  userId: "userId",
                  childCommentIds: const [],
                  lessonId: "lessonId",
                  comment: "comment",
                  commentAt: RandomDate.withRange(2020, 2022).random(),
                ),
              ),
      );

  void togglePage() => setState(() => isFirstPage = !isFirstPage);
}

class ParentCommentPage extends StatelessWidget {
  const ParentCommentPage({
    super.key,
    required this.onCommentTab,
  });

  final Function()? onCommentTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.whiteColor,
          elevation: 0.6,
          centerTitle: false,
          title: LinkText(
            contentText1: "Comments\t\t",
            contentText2: "15",
            onTap1: () {},
            onTap2: () {},
            text1Style: AppStyles.headline6TextStyle.copyWith(
              fontWeight: FontWeight.w900,
            ),
            text2Style: AppStyles.subtitle1TextStyle,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              LessonCommentTextField(
                onCommentSubmit: (submitValue) => logger.log(submitValue),
              ),
              ListView.builder(
                itemCount: 15,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                primary: false,
                itemBuilder: (context, index) => LessonCommentItem(
                  comment: LessonCommentModel(
                    id: "id",
                    userId: "userId",
                    childCommentIds: const [],
                    lessonId: "lessonId",
                    comment: "comment",
                    commentAt: RandomDate.withRange(2020, 2022).random(),
                  ),
                  replyOnTab: onCommentTab,
                  haveReplies: Random().nextBool(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailComment extends StatelessWidget {
  const DetailComment({
    super.key,
    required this.onCommentTab,
    required this.comment,
  });

  final Function()? onCommentTab;
  final LessonCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onCommentTab!();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0.6,
          centerTitle: false,
          foregroundColor: AppColors.blackColor,
          title: Text(
            "Reply",
            style: AppStyles.headline6TextStyle.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: AppColors.neutral.shade200,
                padding: EdgeInsets.only(bottom: AppDimens.mediumHeightDimens),
                child: LessonCommentItem(
                  comment: comment,
                  haveReplies: false,
                ),
              ),
              LessonCommentTextField(
                onCommentSubmit: (submitValue) => logger.log(submitValue),
                paddingLeft: AppDimens.extraLargeWidthDimens * 2,
                avatarSize: AppDimens.extraLargeHeightDimens * 1.4,
              ),
              Padding(
                padding: EdgeInsets.only(left: AppDimens.mediumWidthDimens * 5),
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  primary: false,
                  itemBuilder: (context, index) => LessonCommentItem(
                    comment: LessonCommentModel(
                      id: "id",
                      userId: "userId",
                      childCommentIds: const [],
                      lessonId: "lessonId",
                      comment: "comment",
                      commentAt: RandomDate.withRange(2020, 2022).random(),
                    ),
                    // replyOnTab: onCommentTab,
                    haveReplies: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/