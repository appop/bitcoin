// Copyright (c) 2011-2014 The nealcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef nealcoin_QT_nealcoinADDRESSVALIDATOR_H
#define nealcoin_QT_nealcoinADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class nealcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit nealcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** nealcoin address widget validator, checks for a valid nealcoin address.
 */
class nealcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit nealcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // nealcoin_QT_nealcoinADDRESSVALIDATOR_H
