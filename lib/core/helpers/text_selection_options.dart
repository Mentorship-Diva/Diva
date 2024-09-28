import 'package:flutter/material.dart';

class TextSelectionOptions {
  static AdaptiveTextSelectionToolbar emailTextSelectionOptions(
      context, editableTextState) {
    final List<ContextMenuButtonItem> buttonItems =
        editableTextState.contextMenuButtonItems;
    buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
      return buttonItem.type == ContextMenuButtonType.paste &&
          buttonItem.type == ContextMenuButtonType.cut &&
          buttonItem.type == ContextMenuButtonType.copy &&
          buttonItem.type == ContextMenuButtonType.selectAll &&
          buttonItem.type == ContextMenuButtonType.liveTextInput;
    });
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: buttonItems,
    );
  }

  static AdaptiveTextSelectionToolbar passwordTextSelectionOptions(
      context, editableTextState) {
    final List<ContextMenuButtonItem> buttonItems =
        editableTextState.contextMenuButtonItems;
    buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
      return buttonItem.type == ContextMenuButtonType.cut &&
          buttonItem.type == ContextMenuButtonType.copy &&
          buttonItem.type == ContextMenuButtonType.selectAll &&
          buttonItem.type == ContextMenuButtonType.liveTextInput;
    });
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: buttonItems,
    );
  }
}
