import http from 'k6/http';
import { sleep } from 'k6';

// This collects your endpoints - note that the test will use the one assigned in `endpointToTest`
const endpoints = {
  ec2: '',
  fargate: '',
  lambda: '',
  demo: 'http://test.k6.io'
}

// Use this to point to which URL to use
const endpointToTest = endpoints['demo'];

export const options = {
  vus: 500,
  duration: '30s',
  thresholds: {
    http_req_failed: ['rate<0.01'], // HTTP errors should be less than 1%
    http_req_duration: ['p(95)<200'], // 95% of requests should be below 200ms
  }
};

export default function () {
  http.get(endpointToTest);
  sleep(1);
}

export function handleSummary(data) {
  return {
    'summary.json': JSON.stringify(data)
  };
}
