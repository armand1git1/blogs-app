# tests/test_app.py
import unittest
from unittest.mock import patch, MagicMock
from app import app, blogs


class TestApp(unittest.TestCase):

    @patch('app.render_template')
    @patch('app.cursor')
    def test_blogs(self, mock_cursor, mock_render_template):
        # Set up the mock cursor
        mock_cursor.execute.return_value = None
        mock_cursor.fetchall.return_value = [
            (1, 'Title 1', 'Subtitle 1', 'Content 1', 'Image 1'),
            (2, 'Title 2', 'Subtitle 2', 'Content 2', 'Image 2')
        ]
     
        # Set up the mock render_template
        mock_render_template.return_value = 'rendered_template'

        # Call the function
        result = blogs()

        # Assertions
        mock_cursor.execute.assert_called_once_with('SELECT * FROM blogs')
        mock_render_template.assert_called_once_with('blogs.html', blogs=[
            {'id': 1, 'title': 'Title 1', 'subtitle': 'Subtitle 1', 'content': 'Content 1', 'image': 'Image 1'},
            {'id': 2, 'title': 'Title 2', 'subtitle': 'Subtitle 2', 'content': 'Content 2', 'image': 'Image 2'}
        ], number=2)
        self.assertEqual(result, 'rendered_template')


if __name__ == '__main__':
    unittest.main()