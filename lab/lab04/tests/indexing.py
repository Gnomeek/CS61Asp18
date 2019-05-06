test = {
  'name': 'List Indexing',
  'points': 0,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          >>> x = [1, 3, [5, 7], 9] # Write the expression that indexes into x to output the 7
          3450d5df7f6d639c9dc883cf31cc62bd
          # locked
          >>> x = [[7]] # Write the expression that indexes into x to output the 7
          03e2a566fa83f164d9923dd9c2392471
          # locked
          >>> x = [3, 2, 1, [9, 8, 7]] # Write the expression that indexes into x to output the 7
          d24c8f2d11e78746dea49a7fde70642f
          # locked
          >>> x = [[3, [5, 7], 9]] # Write the expression that indexes into x to output the 7
          9e7bc1866151855ea8424d3c51f4dbe6
          # locked
          """,
          'hidden': False,
          'locked': True
        }
      ],
      'scored': False,
      'type': 'wwpp'
    },
    {
      'cases': [
        {
          'code': r"""
          >>> lst = [3, 2, 7, [84, 83, 82]]
          >>> lst[4]
          8dfecce35cfbb620490b1aa9637bdafd
          # locked
          >>> lst[3][0]
          89d2c4e2851d68c81d820360eb31bc36
          # locked
          """,
          'hidden': False,
          'locked': True
        }
      ],
      'scored': False,
      'type': 'wwpp'
    }
  ]
}
