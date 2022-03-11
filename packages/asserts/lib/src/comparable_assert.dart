abstract class ComparableAssert<SELF extends ComparableAssert<SELF, ACTUAL>,
    ACTUAL extends Comparable<ACTUAL>> {
  SELF isEqualByComparingTo(ACTUAL other);

  SELF isNotEqualByComparingTo(ACTUAL other);

  SELF isLessThan(ACTUAL other);

  SELF isLessThanOrEqualTo(ACTUAL other);
}

abstract class AbstractComparableAssert<
        SELF extends AbstractComparableAssert<SELF, ACTUAL>,
        ACTUAL extends Comparable<ACTUAL>>
    implements ComparableAssert<SELF, ACTUAL> {

  SELF isEqualByComparingTo(ACTUAL other) {
    return this;
  }

  SELF isNotEqualByComparingTo(ACTUAL other);

  SELF isLessThan(ACTUAL other);

  SELF isLessThanOrEqualTo(ACTUAL other);
}
