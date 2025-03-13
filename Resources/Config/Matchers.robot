*** Keywords ***
Should be different
    [Arguments]    ${expected}    ${actual}
    Should be true    ${expected} != ${actual}

Should be greater than
    [Arguments]    ${expected}    ${actual}
    Should be true    ${expected} > ${actual}

Should be greater than or equal to
    [Arguments]    ${expected}    ${actual}
    Should be true    ${expected} >= ${actual}

Should be less than
    [Arguments]    ${expected}    ${actual}
    Should be true    ${expected} < ${actual}

Should be less than or equal to
    [Arguments]    ${expected}    ${actual}
    Should be true    ${expected} <= ${actual}
