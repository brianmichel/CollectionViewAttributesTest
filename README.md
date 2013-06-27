CollectionViewAttributesTest
============================

Testing a UICollectionView with custom `UICollectionViewLayoutAttributes`

It seems that if you implement a UICollectionView with a subclass of `UICollectionViewLayoutAttributes`
you *MUST* implement `copyWithZone:` otherwise any custom values you've defined will not carry through to
your cell. A copy of these attributes is made and passed along before getting to your cell's
`applyLayoutAttributes:` method.
