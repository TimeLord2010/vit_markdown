import 'package:flutter/material.dart';
import 'package:vit_markdown/vit_markdown.dart';

class FullMarkdown extends StatelessWidget {
  const FullMarkdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: VitMarkdown(
        markdown: '''
    # Full Markdown example

    This is a full markdown example.

    ## Headers

    ### Header 3

    #### Header 4

    ##### Header 5

    ###### Header 6

    ## Text

    This is a paragraph.

    This is another paragraph.

    This is a paragraph with **bold** text.

    This is a paragraph with *italic* text.

    This is a paragraph with ***bold italic*** text.

    This is a paragraph with ~~strikethrough~~ text.

    This is a paragraph with `inline code` text.

    This is a paragraph with a [link](www.google.com).

    ## Lists

    ### Unordered list

    - Item 1
    - Item 2
    - Item 3

    ### Ordered list

    1. Item 1
    2. Item 2
    3. Item 3

    ## Blockquotes

    > This is a blockquote.

    ## Code blocks

    ```
    This is a code block.
    ```

    ## Tables

    | Header 1 | Header 2 | Header 3 |
    | -------- | -------- | -------- |
    | Row 1    | Row 1    | Row 1    |
    | Row 2    | Row 2    | Row 2    |
    | Row 3    | Row 3    | Row 3    |

    ## Images

    ![Image](https://via.placeholder.com/150)

    ## Horizontal rule

    ---

    ## Footnotes

    This is a paragraph with a footnote[^1].

    [^1]: This is the footnote.

    ## Math

    This is a paragraph with math \$x^2\$.

    This is a paragraph with a math block:

    \$\$
    x^2
    \$\$

    ## HTML

    This is a paragraph with HTML <b>bold</b> text.

    This is a paragraph with a HTML <a href="www.google.com">link</a>.

    ## Custom elements

    This is a paragraph with a custom element.

    <custom-element></custom-element>

    ## Custom styles

    This is a paragraph with a custom style.

    <style>
    p {
      color: red;
    }
    </style>

    This is a paragraph with a custom class.

    <style>
    .red {
      color: red;
    }
    </style>

    <p class="red">This is a paragraph with a custom class.</p>
    ''',
      ),
    );
  }
}
