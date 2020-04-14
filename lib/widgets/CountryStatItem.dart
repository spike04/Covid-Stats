import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../base/models.dart';
import '../base/utils.dart';

class CountryStatItem extends StatelessWidget {
  final LocalStatsData stat;

  const CountryStatItem(this.stat);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Color(0xFFEFEFEF),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: stat.countryInfo.flag,
              height: 24,
              width: 32,
            ),
            SizedBox(width: 10),
            Text(
              '${stat.country}',
              style:
                  Theme.of(context).textTheme.title.copyWith(color: blackDim),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Cases',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Text(
                    '${performFormatting(stat.cases)}',
                    style:
                        Theme.of(context).textTheme.title.copyWith(color: red),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Death',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Text(
                    '${performFormatting(stat.deaths)}',
                    style:
                        Theme.of(context).textTheme.title.copyWith(color: red),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Recovered',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Text(
                    '${performFormatting(stat.recovered)}',
                    style:
                        Theme.of(context).textTheme.title.copyWith(color: red),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Active',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Text(
                    '${performFormatting(stat.active)}',
                    style:
                        Theme.of(context).textTheme.title.copyWith(color: red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
