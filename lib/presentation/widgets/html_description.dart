import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../core/constants/app_strings.dart';

/// Renders Shopify HTML descriptions using flutter_html package.
/// 
/// Why flutter_html over manual parsing:
/// - Shopify descriptions contain complex HTML (lists, tables, links, styling)
/// - Manual parsing would require 500+ lines of regex/widget mapping
/// - flutter_html handles edge cases (nested tags, malformed HTML, entities)
/// - Maintains semantic structure (headings, paragraphs, lists)
class HtmlDescription extends StatelessWidget {
  final String htmlContent;

  const HtmlDescription({super.key, required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    if (htmlContent.isEmpty) {
      return const SizedBox.shrink();
    }

    return Html(
      data: htmlContent,
      style: {
        'body': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(15),
          lineHeight: const LineHeight(1.6),
          color: Colors.grey.shade800,
        ),
        'p': Style(margin: Margins.only(bottom: 12)),
        'h1': Style(
          fontSize: FontSize(22),
          fontWeight: FontWeight.bold,
          margin: Margins.only(bottom: 12, top: 16),
        ),
        'h2': Style(
          fontSize: FontSize(20),
          fontWeight: FontWeight.w600,
          margin: Margins.only(bottom: 10, top: 14),
        ),
        'h3': Style(
          fontSize: FontSize(18),
          fontWeight: FontWeight.w600,
          margin: Margins.only(bottom: 8, top: 12),
        ),
        'ul': Style(margin: Margins.only(bottom: 12, left: 16)),
        'ol': Style(margin: Margins.only(bottom: 12, left: 16)),
        'li': Style(margin: Margins.only(bottom: 4)),
        'strong': Style(fontWeight: FontWeight.w600),
        'em': Style(fontStyle: FontStyle.italic),
        'a': Style(
          color: Theme.of(context).primaryColor,
          textDecoration: TextDecoration.underline,
        ),
      },
    );
  }
}

/// Expandable description with overflow detection.
/// 
/// Why not just show expand button always:
/// - Short descriptions don't need expansion UI clutter
/// - TextPainter measures actual overflow before showing button
/// - Improves UX by avoiding unnecessary interactions
class ExpandableHtmlDescription extends StatefulWidget {
  final String htmlContent;
  final int maxLines;
  final double lineHeight;

  const ExpandableHtmlDescription({
    super.key,
    required this.htmlContent,
    this.maxLines = 3,
    this.lineHeight = 24.0,
  });

  @override
  State<ExpandableHtmlDescription> createState() =>
      _ExpandableHtmlDescriptionState();
}

class _ExpandableHtmlDescriptionState extends State<ExpandableHtmlDescription> {
  bool _isExpanded = false;
  bool _needsExpansion = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            AppStrings.productDescription,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final plainText = _stripHtmlTags(widget.htmlContent);

            final textSpan = TextSpan(
              text: plainText,
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.grey.shade800,
              ),
            );

            final textPainter = TextPainter(
              text: textSpan,
              maxLines: widget.maxLines,
              textDirection: TextDirection.ltr,
            )..layout(maxWidth: constraints.maxWidth);

            final didOverflow = textPainter.didExceedMaxLines;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && _needsExpansion != didOverflow) {
                setState(() {
                  _needsExpansion = didOverflow;
                });
              }
            });

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_isExpanded || !didOverflow)
                  HtmlDescription(htmlContent: widget.htmlContent)
                else
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: widget.maxLines * widget.lineHeight,
                    ),
                    child: ClipRect(
                      child: HtmlDescription(htmlContent: widget.htmlContent),
                    ),
                  ),
                if (didOverflow) ...[
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          _isExpanded ? 'Daha az göster' : 'Devamını oku',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }

  // MARK: - Helpers

  String _stripHtmlTags(String htmlString) {
    final RegExp htmlTagRegExp = RegExp(
      r'<[^>]*>',
      multiLine: true,
      caseSensitive: false,
    );

    String result = htmlString
        .replaceAll(htmlTagRegExp, '')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .trim();

    return result;
  }
}
